class PetsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

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


  # POST /pets
  def create
    pet = Pet.new(pet_params)
    if pet.save
      render json: pet, status: :created
    else
      render json: { error: pet.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private
  def pet_params
    params.require(:pet).permit(
      "name",
      "pet_type",
      "birthdate",
      "breed",
      "onsale",
      "price",
      "user_id") # Adjust as needed
  end
end
