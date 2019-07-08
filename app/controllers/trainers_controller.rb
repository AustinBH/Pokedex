class TrainersController < ApplicationController
  def index
    trainers = Trainer.all
    render json: trainers, :include => {:pokemon => {:except => [:created_at, :updated_at]} }, :only => [:username, :id]
  end
end
