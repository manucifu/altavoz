require "application_system_test_case"

class TemporadaCapitulosTest < ApplicationSystemTestCase
  setup do
    @temporada_capitulo = temporada_capitulos(:one)
  end

  test "visiting the index" do
    visit temporada_capitulos_url
    assert_selector "h1", text: "Temporada Capitulos"
  end

  test "creating a Temporada capitulo" do
    visit temporada_capitulos_url
    click_on "New Temporada Capitulo"

    check "Activo" if @temporada_capitulo.activo
    fill_in "Activo desde", with: @temporada_capitulo.activo_desde
    fill_in "Activo hasta", with: @temporada_capitulo.activo_hasta
    fill_in "Num capitulo", with: @temporada_capitulo.num_capitulo
    fill_in "Num temporada", with: @temporada_capitulo.num_temporada
    click_on "Create Temporada capitulo"

    assert_text "Temporada capitulo was successfully created"
    click_on "Back"
  end

  test "updating a Temporada capitulo" do
    visit temporada_capitulos_url
    click_on "Edit", match: :first

    check "Activo" if @temporada_capitulo.activo
    fill_in "Activo desde", with: @temporada_capitulo.activo_desde
    fill_in "Activo hasta", with: @temporada_capitulo.activo_hasta
    fill_in "Num capitulo", with: @temporada_capitulo.num_capitulo
    fill_in "Num temporada", with: @temporada_capitulo.num_temporada
    click_on "Update Temporada capitulo"

    assert_text "Temporada capitulo was successfully updated"
    click_on "Back"
  end

  test "destroying a Temporada capitulo" do
    visit temporada_capitulos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Temporada capitulo was successfully destroyed"
  end
end
