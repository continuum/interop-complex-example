require 'test_helper'

class PersonasControllerTest < ActionDispatch::IntegrationTest
  setup do
    
  end

  test "should create person" do
    assert_difference('Persona.count') do
      post personas_url, params: { persona: { nombres: "Jose", apellidos: "Altuve", telefonos_attributes: { "0": {numero: "12345678" }, "1": {numero: "87654321" } } } }
    end
    assert_response :created
    assert_match "Jose", @response.body
  end

  test "should show a list of persons" do
    Persona.create(nombres: "Jose", apellidos: "Altuve")
    get personas_url
    assert_response :success
    assert_match "Jose", @response.body
  end

end
