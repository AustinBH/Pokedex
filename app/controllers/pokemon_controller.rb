class PokemonController < ApplicationController
  def index
    pokemons = Pokemon.all
    render json: pokemons, exclude: [:created_at, :updated_at]
  end

  def show
    pokemon = Pokemon.find(params[:id])
    render json: pokemon
  end

  def search
    all_pokemon = Pokemon.all
    all_pokemon.select do |pokemon|
      types = pokemon.pokemon_type.split(" ")
      types.include?(params[:type])
    end
    render json: all_pokemon
  end
end
