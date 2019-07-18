class V1::PokemonController < ApplicationController
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
      all_pokemon = pokemons.select do |pokemon|
        pokemon.generation == params[:generation]
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
    render json: pokemon, except: [:created_at, :updated_at, :evolution_tree]
  end

end
