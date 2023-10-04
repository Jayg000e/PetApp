class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end
  def by_user
    # Retrieve pets belonging to the user with the provided :userid
    user_id = params[:userid]
    pets = Pet.where(user_id: user_id) # Assuming you have a Pet model

    if pets.empty?
      render json: { error: "No pets found for user with ID #{user_id}" }, status: :not_found
    else
      render json: pets, status: :ok
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to @pet, notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_url, notice: 'Pet was successfully deleted.'
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :birthdate, :breed)
  end
end
