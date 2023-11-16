class ActivitiesController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create,:destroy]

    def index
        @activities = Activity.all
        render json: @activities
    end

    def show
      @activity = Activity.find(params[:id])
      render json: @activity
    end

    def by_pet
      # Retrieve activites belonging to the pet with the provided: petid
      pet_id = params[:petid]
      activites = Activity.where(pet_id: pet_id)

      if activites.empty?
        render json: { error: "No activities found for pet with ID #{pet_id}" }, status: :not_found
      else
        render json: activites, status: :ok
      end
    end

    def create
      activity = Activity.new(activity_params)

      if activity.save
        render json: activity, status: :created
      else
        render json: { error: activity.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end

    # delete activity: /activities/:id (delete)
    def destroy
      @activity = Activity.find(params[:id])
      @activity.destroy
    end

    private

    def activity_params
      params.require(:activity).permit(
        "content",
        "pet_id",
        )
    end
  end
