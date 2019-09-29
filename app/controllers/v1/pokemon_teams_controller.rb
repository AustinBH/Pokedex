class V1::PokemonTeamsController < ApplicationController
  def create
    pokemon_team = PokemonTeam.create(pokemon_teams_params)
    render json: pokemon_team
  end

  def destroy
    pokemon_team = PokemonTeam.find_by(pokemon_teams_params)
    pokemon_team.delete
  end

  private
  def pokemon_teams_params
    params.require(:pokemon_team).permit(:team_id, :pokemon_id)
  end
end
