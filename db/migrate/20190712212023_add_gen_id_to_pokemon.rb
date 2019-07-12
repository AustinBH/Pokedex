class AddGenIdToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemon, :generation, :string
  end
end
