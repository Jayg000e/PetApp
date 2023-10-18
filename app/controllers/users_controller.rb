class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:new, :create, :edit, :update, :destroy]

    # display all users: /users (get)
    def index
      @users = User.all
      render json: @users
    end

    # display single user: /users/id (get)
    def show
      @user = User.find(params[:id])
      render json: @user
    end
<<<<<<< Updated upstream
  
    # create: 0.0.0.0:3000/users (post)
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if missing_user_info?(user_params)
        flash.now[:error] = 'Please enter valid username and password.'
        render 'new'
      end

      if User.find_by(username: user_params["username"])
        flash.now[:error] = 'Please enter valid username and password.'
        render 'new'
      end
=======

    # create: /users (post)
    def create
      user = User.new(user_params)

      if missing_user_info?(user_params)
        flash.now[:error] = 'Please enter valid username and password.'
        render json: { error: 'Please enter valid username and password.' }, status: :unprocessable_entity

      elsif User.find_by(username: user_params["username"])
        flash.now[:error] = "Username has already been taken"
        render json: { error: "Username has already been taken" }, status: :unprocessable_entity
>>>>>>> Stashed changes

      elsif user.save
        flash[:notice] = 'User Successfully Created!'
        render json: { user: user, message: 'User Successfully Created!' }, status: :created
      else
        render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end

    # edit: 0.0.0.0:3000/users/:id (patch)
<<<<<<< Updated upstream
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user, notice: 'User Info was successfully updated.'
        else
            flash.now[:error] = 'User update failed.'
            render 'edit'
        end
    end
  
=======
    def update
      @user = User.find(params[:id])
    
      if @user.update(password: user_params[:password])
        flash[:notice] = 'Password was successfully updated'
        render json: { user: @user, message: 'Password was successfully updated' }, status: :ok
      else
        render json: { error: 'Password update failed' }, status: :unprocessable_entity
      end
    end    

>>>>>>> Stashed changes
    # delete user: 0.0.0.0:3000/users/:id (delete)
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url, notice: 'User was successfully deleted.'
    end

<<<<<<< Updated upstream
  
=======
>>>>>>> Stashed changes
    private
    def user_params
      params.require(:user).permit(:username, :password, :role)
    end

    private
    def missing_user_info?(user_params)
      user_params[:username].nil? or user_params[:username].blank? or user_params[:password].nil? or user_params[:password].blank?
    end
  end
<<<<<<< Updated upstream
  
=======

>>>>>>> Stashed changes
