class PagesController < ApplicationController

  def home
    readme = File.read("#{Rails.root}/JSONREADME.md")
    render json: readme
  end

end
