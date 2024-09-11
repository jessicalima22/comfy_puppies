class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  def index
    @animals = policy_scope(Animal)
    @animals =  @animals.where("breed ILIKE ?", "%#{params[:breed]}%") if params[:breed].present?
    @animals = @animals.where(size: params[:size]) if params[:size].present?
    @animals = @animals.where(gender: params[:gender]) if params[:gender].present?
    @animals = @animals.where(age: params[:age]) if params[:age].present?
    @animals = @animals.where(castrated: params[:castrated]) if params[:castrated].present?
    @animals = @animals.where(vaccinated: params[:vaccinated]) if params[:vaccinated].present?
    @animals = @animals.where(dewormed: params[:dewormed]) if params[:dewormed].present?
    @animals = @animals.where("special_needed ILIKE ?", "%#{params[:special_needed]}%") if params[:special_needed].present?
    @animals = @animals.where("location ILIKE ?", "%#{params[:location]}%") if params[:location].present?
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
