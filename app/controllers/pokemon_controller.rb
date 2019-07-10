class PokemonController < ApplicationController
  def index
    if params[:type]
      pokemons = Pokemon.all
      all_pokemon = []
      pokemons.each do |pokemon|
        types = pokemon.pokemon_type.split(" ")
        if types.include?(params[:type])
          all_pokemon << pokemon
        end
      end
      if all_pokemon.length > 0
        render json: all_pokemon, exclude: [:created_at, :updated_at]
      else
        render json: {message: "There are no pokemon of #{params[:type]} type."}
      end
    else
      all_pokemon = Pokemon.all
      render json: all_pokemon, exclude: [:created_at, :updated_at]
    end
  end

  def show
    pokemon = Pokemon.find(params[:id])
    render json: pokemon, exclude: [:created_at, :updated_at]
  end

end
