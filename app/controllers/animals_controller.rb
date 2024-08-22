class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  def index
    @animals = Animal.all
    @animals = @animals.where("breed ILIKE ?", "%#{params[:breed]}%") if params[:breed].present?
    @animals = @animals.where(size: params[:size]) if params[:size].present?
    @animals = @animals.where(gender: params[:gender]) if params[:gender].present?
    @animals = @animals.where(age: params[:age]) if params[:age].present?
    @animals = @animals.where(castrated: params[:castrated]) if params[:castrated].present?
    @animals = @animals.where(vaccinated: params[:vaccinated]) if params[:vaccinated].present?
    @animals = @animals.where(dewormed: params[:dewormed]) if params[:dewormed].present?
    @animals = @animals.where("special_needed ILIKE ?", "%#{params[:special_needed]}%") if params[:special_needed].present?
    @animals = @animals.where("location ILIKE ?", "%#{params[:location]}%") if params[:location].present?
  end
  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @animal.update(animal_params)
    redirect_to animal_path(@animal)
  end

  def destroy
    @animal.destroy
    redirect_to animals_path, status: :see_other
  end


  private

  def animal_params
    params.require(:animal).permit(:name, :breed, :size, :gender, :age, :castrated, :vaccinated, :special_needed)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
