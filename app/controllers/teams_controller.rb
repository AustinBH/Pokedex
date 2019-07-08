module Api
  module V1
    class TeamsController < ApplicationController
      def index
        teams = Team.all
        render json: teams, :include => {:trainer => {:except => [:created_at, :updated_at]}, :pokemons => {:except => [:created_at, :updated_at]}}, :only => [:name, :id]
      end
    end
  end
end
