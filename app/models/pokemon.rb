class Pokemon < ApplicationRecord
  has_many :pokemon_teams
  has_many :teams, through: :pokemon_teams

  def self.filter_by_pokedex (array)
    array.sort {|a, b| a.pokedex_number <=> b.pokedex_number}
  end
end
