class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @nimal = Animal.find(params[:id])
  end
end
