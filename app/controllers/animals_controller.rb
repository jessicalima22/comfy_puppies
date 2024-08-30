class AnimalsController < ApplicationController

  def index
    filters = params[:animal] || {}
    @animals = Animal.all
    @animals = @animals.where('lower(name) = ?', filters[:name].downcase) if filters[:name].present?
    @animals = @animals.where('lower(breed) = ?', filters[:breed].downcase) if filters[:breed].present?
    @animals = @animals.where('lower(size) = ?', filters[:size].downcase) if filters[:size].present?
    @animals = @animals.where('lower(gender) = ?', filters[:gender].downcase) if filters[:gender].present?
    @animals = @animals.where('lower(age) = ?', filters[:age].downcase) if filters[:age].present?
    @animals = @animals.where(castrated: filters[:castrated]) unless filters[:castrated].blank?
    @animals = @animals.where(vaccinated: filters[:vaccinated]) unless filters[:vaccinated].blank?
    @animals = @animals.where(dewormed: filters[:dewormed]) unless filters[:dewormed].blank?
    @animals = @animals.where('lower(special_needed) LIKE ?', "%#{filters[:special_needed].downcase}%") if filters[:special_needed].present?
    @animals = @animals.where('lower(location) LIKE ?', "%#{filters[:location].downcase}%") if filters[:location].present?
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
    @animal.user = current_user
    if @animal.save!
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
