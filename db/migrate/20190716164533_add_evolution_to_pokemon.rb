class AddEvolutionToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemon, :evolution_tree, :string
  end
end
