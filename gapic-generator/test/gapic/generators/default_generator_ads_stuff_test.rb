require "test_helper"
require "gapic/generators/default_generator"

class DefaultGeneratorAdsStuffTest < GeneratorTest
  def test_ads_stuff_generate
    generator = Gapic::Generators::DefaultGenerator.new api(:ads_stuff)
    generator.generate.each do |file|
      assert_equal expected_content(:ads_stuff, file.name), file.content
    end
  end
end