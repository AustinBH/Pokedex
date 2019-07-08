module Api
  module V1
    class TrainersController < ApplicationController
      def index
        trainers = Trainer.all
        render json: trainers, :include => {:pokemons => {:except => [:created_at, :updated_at]} }, :only => [:username, :id]
      end
    end
  end
end
