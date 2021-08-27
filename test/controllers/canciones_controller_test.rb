require "test_helper"

class CancionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cancione = canciones(:one)
  end

  test "should get index" do
    get canciones_url
    assert_response :success
  end

  test "should get new" do
    get new_cancione_url
    assert_response :success
  end

  test "should create cancione" do
    assert_difference('Cancione.count') do
      post canciones_url, params: { cancione: { activo: @cancione.activo, descripcion: @cancione.descripcion, nombre: @cancione.nombre, temporada_capitulo_id: @cancione.temporada_capitulo_id, url_spotify: @cancione.url_spotify, url_youtube: @cancione.url_youtube } }
    end

    assert_redirected_to cancione_url(Cancione.last)
  end

  test "should show cancione" do
    get cancione_url(@cancione)
    assert_response :success
  end

  test "should get edit" do
    get edit_cancione_url(@cancione)
    assert_response :success
  end

  test "should update cancione" do
    patch cancione_url(@cancione), params: { cancione: { activo: @cancione.activo, descripcion: @cancione.descripcion, nombre: @cancione.nombre, temporada_capitulo_id: @cancione.temporada_capitulo_id, url_spotify: @cancione.url_spotify, url_youtube: @cancione.url_youtube } }
    assert_redirected_to cancione_url(@cancione)
  end

  test "should destroy cancione" do
    assert_difference('Cancione.count', -1) do
      delete cancione_url(@cancione)
    end

    assert_redirected_to canciones_url
  end
end
