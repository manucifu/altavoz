require "application_system_test_case"

class CancionesTest < ApplicationSystemTestCase
  setup do
    @cancione = canciones(:one)
  end

  test "visiting the index" do
    visit canciones_url
    assert_selector "h1", text: "Canciones"
  end

  test "creating a Cancione" do
    visit canciones_url
    click_on "New Cancione"

    check "Activo" if @cancione.activo
    fill_in "Descripcion", with: @cancione.descripcion
    fill_in "Nombre", with: @cancione.nombre
    fill_in "Temporada capitulo", with: @cancione.temporada_capitulo_id
    fill_in "Url spotify", with: @cancione.url_spotify
    fill_in "Url youtube", with: @cancione.url_youtube
    click_on "Create Cancione"

    assert_text "Cancione was successfully created"
    click_on "Back"
  end

  test "updating a Cancione" do
    visit canciones_url
    click_on "Edit", match: :first

    check "Activo" if @cancione.activo
    fill_in "Descripcion", with: @cancione.descripcion
    fill_in "Nombre", with: @cancione.nombre
    fill_in "Temporada capitulo", with: @cancione.temporada_capitulo_id
    fill_in "Url spotify", with: @cancione.url_spotify
    fill_in "Url youtube", with: @cancione.url_youtube
    click_on "Update Cancione"

    assert_text "Cancione was successfully updated"
    click_on "Back"
  end

  test "destroying a Cancione" do
    visit canciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cancione was successfully destroyed"
  end
end
