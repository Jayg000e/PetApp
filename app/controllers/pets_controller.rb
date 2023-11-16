class PetsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create,:put_offsale,:put_onsale]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def onsale_pets
    # Perform a JOIN operation with the users table.
    @pets_on_sale = Pet.joins(:user).where(onsale: true).select('pets.*, users.username as owner_name, users.email as owner_email')
    # Render the joined data as JSON.
    render json: @pets_on_sale.as_json(include: { user: { only: [:username, :email] } })
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

  # PATCH /pets/:id/put_onsale
  def put_onsale
    @pet = Pet.find(params[:id])

    # Update the onsale status and price
    @pet.onsale = true
    @pet.price = params[:price] if params[:price]

    if @pet.save
      render json: @pet, status: :ok
    else
      render json: { error: @pet.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  # PATCH /pets/:id/put_offsale
  def put_offsale
    @pet = Pet.find(params[:id])

    # Update the onsale status
    @pet.onsale = false

    @pet.price = nil

    if @pet.save
      render json: @pet, status: :ok
    else
      render json: { error: @pet.errors.full_messages.join(', ') }, status: :unprocessable_entity
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
