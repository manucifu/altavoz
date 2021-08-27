class CreateCanciones < ActiveRecord::Migration[6.1]
  def change
    create_table :canciones do |t|
      t.string :url_youtube
      t.string :url_spotify
      t.string :nombre
      t.boolean :activo
      t.references :temporada_capitulo, null: false, foreign_key: true
      t.string :descripcion

      t.timestamps
    end
  end
end
