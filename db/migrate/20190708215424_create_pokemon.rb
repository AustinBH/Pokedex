class CreatePokemon < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon do |t|
      t.string :name
      t.integer :pokedex_number
      t.string :description
      t.string :pokemon_type
      t.integer :height
      t.integer :weight
      t.string :img_url

      t.timestamps
    end
  end
end
