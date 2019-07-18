class RemoveEvolutionTreeFromPokemon < ActiveRecord::Migration[5.2]
  def change
    remove_column :pokemon, :evolution_tree
  end
end
