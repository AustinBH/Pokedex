class PokemonTeamsController < ApplicationController
  def create
    pokemon_team = PokemonTeam.create(team_id: params[:team_id], pokemon_id: params[:pokemon_id])
    render json: pokemon_team
  end

  def destroy
    pokemon_team = PokemonTeam.find_by(team_id: params[:team_id], pokemon_id: params[:pokemon_id])
    pokemon_team.delete
  end
end
