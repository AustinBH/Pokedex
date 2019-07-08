class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams, :include => {:trainer => {:except => [:created_at, :updated_at]}, :pokemon => {:except => [:created_at, :updated_at]}}, :only => [:name, :id]
  end
end
