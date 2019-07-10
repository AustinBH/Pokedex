class Trainer < ApplicationRecord
  has_many :teams
  has_many :pokemon_teams, through: :teams
  has_many :pokemon, through: :pokemon_teams

  validates :username, uniqueness: true
end
