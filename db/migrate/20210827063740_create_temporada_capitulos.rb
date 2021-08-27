class CreateTemporadaCapitulos < ActiveRecord::Migration[6.1]
  def change
    create_table :temporada_capitulos do |t|
      t.integer :num_temporada
      t.integer :num_capitulo
      t.boolean :activo
      t.date :activo_desde
      t.date :activo_hasta

      t.timestamps
      t.index [:num_temporada, :num_capitulo], unique: true
    end
  end
end
