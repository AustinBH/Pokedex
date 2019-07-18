class V1::TrainersController < ApplicationController
  def index
    trainers = Trainer.all
    render json: trainers, :include => {:pokemon => {:except => [:created_at, :updated_at]} }, :only => [:username, :id]
  end

  def show
    trainer = Trainer.find(params[:id])
    render json: trainer, :include => {:teams => {:include => [:pokemon], :except => [:created_at, :updated_at]} }, :only => [:username, :id]
  end

  def create
    trainer = Trainer.new(username: params[:username])
    if trainer.save
      render json: trainer
    else
      render json: {message: 'Error saving trainer name'}
    end
  end

  def destroy
    trainer = Trainer.find(params[:id])
    trainer.teams.destroy_all
    trainer.delete
  end
end
