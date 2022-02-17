require "test_helper"

class ModelTest < PresenterTest
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_model_has_services
    package = first_package_presenter :language_v1
    model = package.model.as_json
    assert model.key? "services"

    puts package.model_json
  end
end
