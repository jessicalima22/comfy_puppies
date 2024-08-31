class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show]

  def index
    @adoptions = Adoption.where(user_id: current_user.id)
  end

  def show
    authorize @adoption
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @adoption = Adoption.new
    authorize @animal
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user = current_user
    @adoption.animal = Animal.find(params[:adoption][:animal_id])
    authorize @animal
    if @adoption.save
      redirect_to @adoption, notice: 'Adoção realizada com sucesso!'
    else
      render :new
    end
  end

  private

  def set_adoption
    @adoption = Adoption.find(params[:id])
  end

  def adoption_params
    params.require(:adoption).permit(:animal_id)
  end
end
