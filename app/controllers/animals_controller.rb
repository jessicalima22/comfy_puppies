class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  def index
    @animals = policy_scope(Animal)
    if params[:animal].present?
    @animals = @animals.where("breed ILIKE ?", "%#{params[:animal][:breed]}%") if params[:animal][:breed].present?
    @animals = @animals.where(size: params[:animal][:size]) if params[:animal][:size].present?
    @animals = @animals.where(gender: params[:animal][:gender]) if params[:animal][:gender].present?
    @animals = @animals.where(age: params[:animal][:age]) if params[:animal][:age].present?
    @animals = @animals.where(castrated: params[:animal][:castrated]) if params[:animal][:castrated].present?
    @animals = @animals.where(vaccinated: params[:animal][:vaccinated]) if params[:animal][:vaccinated].present?
    @animals = @animals.where(dewormed: params[:animal][:dewormed]) if params[:animal][:dewormed].present?
    @animals = @animals.where("special_needed ILIKE ?", "%#{params[:animal][:special_needed]}%") if params[:animal][:special_needed].present?
    @animals = @animals.where("location ILIKE ?", "%#{params[:animal][:location]}%") if params[:animal][:location].present?
    end
    @animal = Animal.new
  end

  def show
    if @animal.geocoded?
      @markers = [
        {
          lat: @animal.latitude,
          lng: @animal.longitude
        }]
    else
      @markers = []
    end
    authorize @animal
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal
    if @animal.save
      redirect_to animal_path(@animal), notice: 'Animal was successfully created.'
    else
      # @animal.errors.add(:photos) if params[:animal][:photos].length > 5

      render :new, status: :unprocessable_entity, notice: 'Animal was not created.'
    end
  end

  def edit
    authorize @animal
  end

  def update
    authorize @animal
    @animal.update(animal_params)
    redirect_to animal_path(@animal), notice: 'Animal was successfully updated.'
  end

  def destroy
    authorize @animal
    @animal.destroy
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :breed, :age, :gender, :size, :castrated, :vaccinated, :dewormed, :special_needed, :location, photos: [])
  end

end
