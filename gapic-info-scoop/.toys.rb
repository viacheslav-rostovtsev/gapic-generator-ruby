$:.unshift "#{File.dirname(__FILE__)}/lib"
require "sqlite3"
require "pp"
require "model/models"

tool "clean-db" do
	desc "cleans the database"
	
	def run
		db = SQLite3::Database.new "db/gapic-info.db"

		db.execute("drop table if exists DescriptorSets")
		# pp db.execute <<-SQL
		# 	create table DescriptorSets (
		# 		id bigint not null, 
		# 		design_name varchar(1023),

		# 		PRIMARY KEY(id)
		# 	);
		# SQL

		db.execute("drop table if exists FileDescriptors;")
		# pp db.execute <<-SQL
		# 	create table FileDescriptors (
		# 		id bigint not null, 
		# 		design_name varchar(1023),
		# 		descriptor_set_id bigint not null,
		# 		name varchar(255),
		# 		package varchar(255),
		# 		java_package varchar(255),
		# 		java_outer_classname varchar(255),
		# 		java_multiple_files INTEGER,
		# 		java_string_check_utf8 INTEGER,
		# 		optimize_for INTEGER,
		# 		go_package varchar(255),
		# 		cc_generic_services INTEGER,
		# 		java_generic_services INTEGER,
		# 		py_generic_services INTEGER,
		# 		php_generic_services INTEGER,
		# 		deprecated INTEGER,
		# 		cc_enable_arenas INTEGER,
		# 		objc_class_prefix varchar(255),
		# 		csharp_namespace varchar(255),
		# 		swift_prefix varchar(255),
		# 		php_class_prefix varchar(255),
		# 		php_namespace varchar(255),
		# 		php_metadata_namespace varchar(255),
		# 		ruby_package varchar(255),

		# 		PRIMARY KEY(id)
		# 		FOREIGN KEY(descriptor_set_id) REFERENCES Libraries(id)
		# 	);
		# SQL

		db.execute("drop table if exists GemModels")
		pp db.execute <<-SQL
			create table GemModels (
				id bigint not null,
				design_name varchar(1023),
				"name" varchar(255),

				PRIMARY KEY(id)
			);
		SQL

		db.execute("drop table if exists PackageModels")
		pp db.execute <<-SQL
			create table PackageModels (
				id bigint not null,
				design_name varchar(1023),
				gem_model_id bigint not null,

				"name" varchar(255),
				ruby_namespace varchar(255),

				PRIMARY KEY(id)
				FOREIGN KEY(gem_model_id) REFERENCES GemModels(id)
			);
		SQL

		db.execute("drop table if exists ServiceModels")
		pp db.execute <<-SQL
			create table ServiceModels (
				id bigint not null, 
				design_name varchar(1023),
				package_model_id bigint not null,

				name varchar(255),
				
				PRIMARY KEY(id)
				FOREIGN KEY(package_model_id) REFERENCES PackageModels(id)
			);
		SQL

		db.execute("drop table if exists RpcModels")
		pp db.execute <<-SQL
			create table RpcModels (
				id bigint not null, 
				design_name varchar(1023),
				service_model_id bigint not null,

				rpc_name varchar(255),
				input_name varchar(255),
				output_name varchar(255),
				generate_implicit_headers INTEGER,
				generate_explicit_headers INTEGER,
				arity varchar(255),

				
				PRIMARY KEY(id)
				FOREIGN KEY(service_model_id) REFERENCES ServiceModels(id)
			);
		SQL

	end
end

tool "insert-input" do
  desc "takes all json from input and inserts it"
  include :fileutils

  def run
    cli.run "clean-db"
    files = Dir.entries("input").map { |f| File.join("input", f) }.select {|f|  File.file? f}
    unless files.length > 1
      puts "Aborting because no files in input", :red, :bold
			exit 1
    end

    for file in files
      puts "Running insert-gem on #{file}"
      status = cli.run("insert-gem", file)
      puts "Ran insert-gem on #{file}: #{status}"
    end
  end
end


tool "insert-gem" do
	desc "inserts one gem into the database"

	optional_arg :path, desc: "Path of the gem model to insert"

	include :exec, exit_on_nonzero_status: true
	include :fileutils
  include :terminal

	def run 
		if path.nil?
    	puts "Aborting because #{path} is not given", :red, :bold
			exit 1
    end

		db = SQLite3::Database.new "db/gapic-info.db"

		if !File.exist? path
			puts "Aborting because #{path} does not exist", :red, :bold
			exit 1
		end

		gem = JSON.parse(File.read(path), object_class: OpenStruct)
		pp gem

		db.execute("insert into GemModels (id, design_name, name) values (?,?,?)", [gem.id, gem.design_name, gem.name])

		gem.packages.each do |package| 
		  db.execute("insert into PackageModels (id, design_name, gem_model_id, name, ruby_namespace) values (?,?,?,?,?)",
				[package.id, package.design_name, package.gem_model_id, package.name, package.ruby_namespace])

			package.services.each do |service|
				db.execute("insert into ServiceModels (id, design_name, package_model_id, name) values (?,?,?,?)",
					[service.id, service.design_name, service.package_model_id, service.name])

				service.rpcs.each do |rpc|
				db.execute("insert into RpcModels (id, design_name, service_model_id, rpc_name, input_name, output_name, generate_implicit_headers, generate_explicit_headers, arity) values (?,?,?,?,?,?,?,?,?)",
						[rpc.id, rpc.design_name, rpc.service_model_id, rpc.rpc_name, rpc.input_name, rpc.output_name, rpc.generate_implicit_headers ? 1:0, rpc.generate_explicit_headers ? 1:0, rpc.arity])
				end
			end
		end
	end
end

# tool "insert-genmodel" do
	# codegen_path = "output/cloud/vision_v1/codegen.json"
	# fds = ::Model::Package::FileDescriptorSet.decode_json File.read(codegen_path)
	# pp fds 
	# vals = [fds.id, fds.design_name]
	# pp db.execute("insert into DescriptorSets (id, design_name) values (?,?)", vals)

	# fds.file_descriptor_protos.each do |fd|
	#     pp db.execute("insert into FileDescriptors (id, design_name, descriptor_set_id, name, package, java_package, java_outer_classname, java_multiple_files, java_string_check_utf8, optimize_for, go_package, cc_generic_services, java_generic_services, py_generic_services, php_generic_services, deprecated, cc_enable_arenas, objc_class_prefix, csharp_namespace, swift_prefix, php_class_prefix, php_namespace, php_metadata_namespace, ruby_package) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", 
	#         [fd.id, fd.design_name, fd.descriptor_set_id, fd.name, fd.package, fd.java_package, fd.java_outer_classname, 
	#             (fd.java_multiple_files ? 1:0), (fd.java_string_check_utf8 ? 1:0), ::Model::Package::FileDescriptorProto::OptimizeMode.resolve(fd.optimize_for), fd.go_package, (fd.cc_generic_services ? 1:0), (fd.java_generic_services ? 1:0),
	#             (fd.py_generic_services ? 1:0), (fd.php_generic_services ? 1:0), (fd.deprecated ? 1:0), (fd.cc_enable_arenas ? 1:0), fd.objc_class_prefix, fd.csharp_namespace,
	#             fd.swift_prefix, fd.php_class_prefix, fd.php_namespace, fd.php_metadata_namespace, fd.ruby_package])
	# end
# end

