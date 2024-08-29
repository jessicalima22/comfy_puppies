class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
    if params[:query].present?
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
  end

  def show
    @animal = Animal.find(params[:id])
    if @animal.geocoded?
      @markers = [
        {
          lat: @animal.latitude,
          lng: @animal.longitude
        }]
    else
      @markers = []
    end
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to @animal
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to @animal
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :breed, :age, :gender, :size, :castrated, :vaccinated, :dewormed, :special_needed, :location, :photo)
  end

end
