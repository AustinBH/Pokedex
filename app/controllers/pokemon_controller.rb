class PokemonController < ApplicationController
  def index
    pokemons = Pokemon.all
    render json: pokemons, exclude: [:created_at, :updated_at]
  end

  def show
    pokemon = Pokemon.find(params[:id])
    render json: pokemon
  end
end
