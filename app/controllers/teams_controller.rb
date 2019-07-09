class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams, :include => {:trainer => {:except => [:created_at, :updated_at]}, :pokemon => {:except => [:created_at, :updated_at]}}, :only => [:name, :id]
  end

  def show
    team = Team.find(params[:id])
    render json: team, :include => {:trainer => {:except => [:created_at, :updated_at]}, :pokemon => {:except => [:created_at, :updated_at]}}, :only => [:name, :id]
  end
end
