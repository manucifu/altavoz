require "test_helper"

class TemporadaCapitulosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temporada_capitulo = temporada_capitulos(:one)
  end

  test "should get index" do
    get temporada_capitulos_url
    assert_response :success
  end

  test "should get new" do
    get new_temporada_capitulo_url
    assert_response :success
  end

  test "should create temporada_capitulo" do
    assert_difference('TemporadaCapitulo.count') do
      post temporada_capitulos_url, params: { temporada_capitulo: { activo: @temporada_capitulo.activo, activo_desde: @temporada_capitulo.activo_desde, activo_hasta: @temporada_capitulo.activo_hasta, num_capitulo: @temporada_capitulo.num_capitulo, num_temporada: @temporada_capitulo.num_temporada } }
    end

    assert_redirected_to temporada_capitulo_url(TemporadaCapitulo.last)
  end

  test "should show temporada_capitulo" do
    get temporada_capitulo_url(@temporada_capitulo)
    assert_response :success
  end

  test "should get edit" do
    get edit_temporada_capitulo_url(@temporada_capitulo)
    assert_response :success
  end

  test "should update temporada_capitulo" do
    patch temporada_capitulo_url(@temporada_capitulo), params: { temporada_capitulo: { activo: @temporada_capitulo.activo, activo_desde: @temporada_capitulo.activo_desde, activo_hasta: @temporada_capitulo.activo_hasta, num_capitulo: @temporada_capitulo.num_capitulo, num_temporada: @temporada_capitulo.num_temporada } }
    assert_redirected_to temporada_capitulo_url(@temporada_capitulo)
  end

  test "should destroy temporada_capitulo" do
    assert_difference('TemporadaCapitulo.count', -1) do
      delete temporada_capitulo_url(@temporada_capitulo)
    end

    assert_redirected_to temporada_capitulos_url
  end
end
