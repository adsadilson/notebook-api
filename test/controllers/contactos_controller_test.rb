require "test_helper"

class ContactosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contacto = contactos(:one)
  end

  test "should get index" do
    get contactos_url, as: :json
    assert_response :success
  end

  test "should create contacto" do
    assert_difference("Contacto.count") do
      post contactos_url, params: { contacto: { birthdate: @contacto.birthdate, email: @contacto.email, name: @contacto.name } }, as: :json
    end

    assert_response :created
  end

  test "should show contacto" do
    get contacto_url(@contacto), as: :json
    assert_response :success
  end

  test "should update contacto" do
    patch contacto_url(@contacto), params: { contacto: { birthdate: @contacto.birthdate, email: @contacto.email, name: @contacto.name } }, as: :json
    assert_response :success
  end

  test "should destroy contacto" do
    assert_difference("Contacto.count", -1) do
      delete contacto_url(@contacto), as: :json
    end

    assert_response :no_content
  end
end
