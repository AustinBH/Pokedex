class PokemonController < ApplicationController
  def index
    pokemons = Pokemon.all
    if params[:type]
      all_pokemon = pokemons.select do |pokemon|
        types = pokemon.pokemon_type.split(" ")
        types.include?(params[:type])
      end
      if all_pokemon.length > 0
        all_pokemon = Pokemon.filter_by_pokedex(all_pokemon)
        render json: all_pokemon, only: [:name, :pokedex_number, :img_url]
      else
        render json: {message: "There are no pokemon of #{params[:type]} type."}
      end
    elsif params[:name]
      all_pokemon = pokemons.select do |pokemon|
        pokemon.name.downcase.include?(params[:name])
      end
      if all_pokemon.length > 0
        all_pokemon = Pokemon.filter_by_pokedex(all_pokemon)
        render json: all_pokemon, only: [:name, :pokedex_number, :img_url]
      else
        render json: {message: "There are no pokemon with #{params[:name]} in their name."}
      end
    elsif params[:generation]
      case params[:generation]
      when "1"
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 152
        end
      when "2"
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 252 && pokemon.id > 151
        end
      when "3"
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 387 && pokemon.id > 251
        end
      when "4"
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 494 && pokemon.id > 386
        end
        all_pokemon
      when "5"
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 650 && pokemon.id > 493
        end
      when "6"
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id < 722 && pokemon.id > 649
        end
      when "7"
        all_pokemon = pokemons.select do |pokemon|
          pokemon.id > 721
        end
      end
      if all_pokemon
        all_pokemon = Pokemon.filter_by_pokedex(all_pokemon)
        render json: all_pokemon, only: [:name, :pokedex_number, :img_url]
      else
        render json: {message: "#{params[:generation]} is not a valid generation."}
      end
    else
      all_pokemon = Pokemon.filter_by_pokedex(pokemons)
      render json: all_pokemon, only: [:name, :pokedex_number, :img_url]
    end
  end

  def show
    pokemon = Pokemon.find(params[:id])
    render json: pokemon, except: [:created_at, :updated_at]
  end

end
