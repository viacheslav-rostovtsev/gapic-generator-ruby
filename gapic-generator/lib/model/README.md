```
protoc --plugin=protoc-gen-ruby-protobuf=`which protoc-gen-ruby` --ruby-protobuf_out=. package.proto
```

```
protoc --plugin=protoc-gen-ruby-protobuf=`which protoc-gen-ruby` --ruby-protobuf_out=. generation.proto
```