class PokemonController < ApplicationController
  def index
    pokemons = Pokemon.all
    if params[:type]
      all_pokemon = pokemons.select do |pokemon|
        types = pokemon.pokemon_type.split(" ")
        types.include?(params[:type])
      end
      if all_pokemon.length > 0
        render json: all_pokemon, exclude: [:created_at, :updated_at]
      else
        render json: {message: "There are no pokemon of #{params[:type]} type."}
      end
    elsif params[:name]
      all_pokemon = pokemons.select do |pokemon|
        pokemon.name.downcase.include?(params[:name])
      end
      if all_pokemon.length > 0
        render json: all_pokemon, exclude: [:created_at, :updated_at]
      else
        render json: {message: "There are no pokemon with #{params[:name]} in their name."}
      end
    elsif params[:generation]
      if params[:generation] == '1'
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 152
        end
      elsif params[:generation] == '2'
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 252 && pokemon.id > 151
        end
      elsif params[:generation] == '3'
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 387 && pokemon.id > 251
        end
      elsif params[:generation] == '4'
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 494 && pokemon.id > 386
        end
      elsif params[:generation] == '5'
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 650 && pokemon.id > 493
        end
      elsif params[:generation] == '6'
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 722 && pokemon.id > 649
        end
      elsif params[:generation] == '7'
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id > 722
        end
      end
      if all_pokemon
        render json: all_pokemon, exclude: [:created_at, :updated_at]
      else
        render json: {message: "#{params[:generation]} is not a valid generation."}
      end
    else
      all_pokemon = pokemons
      render json: all_pokemon, exclude: [:created_at, :updated_at]
    end
  end

  def show
    pokemon = Pokemon.find(params[:id])
    render json: pokemon, exclude: [:created_at, :updated_at]
  end

end
