class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:new, :create, :edit, :update, :destroy, :login]

    # display all users: 0.0.0.0:3000/users (get)
    def index
      @users = User.all
      render json: @users
    end

    # display single user: 0.0.0.0:3000/users/id (get)
    def show
      @user = User.find(params[:id])
      render json: @user
    end

    # create: /users (post)
    def create
      user = User.new(user_params)

      if missing_user_info?(user_params)
        flash.now[:error] = 'Please enter valid username and password.'
        render json: { error: 'Please enter valid username and password.' }, status: :unprocessable_entity

      elsif User.find_by(username: user_params["username"])
        flash.now[:error] = "Username has already been taken"
        render json: { error: "Username has already been taken" }, status: :unprocessable_entity

      elsif user.save
        flash[:notice] = 'User Successfully Created!'
        render json: { user: user, message: 'User Successfully Created!' }, status: :created
      else
        render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end

    # edit: 0.0.0.0:3000/users/:id (patch)
    def update
      @user = User.find(params[:id])

      if @user.update(password: user_params[:password])
        flash[:notice] = 'Password was successfully updated'
        render json: { user: @user, message: 'Password was successfully updated' }, status: :ok
      else
        render json: { error: 'Password update failed' }, status: :unprocessable_entity
      end
    end

    # delete user: 0.0.0.0:3000/users/:id (delete)
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url, notice: 'User was successfully deleted.'
    end

  def login
    # Parse the JSON request body to access the username and password.
    request_body = JSON.parse(request.body.read)
  
    username = request_body["username"]
    password = request_body["password"]
  
    user = User.find_by(username: username)
  
    if user && user.password == password
      payload = { user_id: user.id }
      token = JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
      render json: { token: token, success: true, message: 'Logged in successfully' }
    else
      render json: { success: false, error: 'Invalid username or password' }, status: :unauthorized
    end
  end
  

    private
    def user_params
      params.require(:user).permit(:username, :password, :role)
    end

    private
    def missing_user_info?(user_params)
      user_params[:username].nil? or user_params[:username].blank? or user_params[:password].nil? or user_params[:password].blank?
    end
  end
