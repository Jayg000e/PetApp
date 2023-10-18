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

    # create: /users (post)
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

      if @user.save
        redirect_to @user, notice: 'User creation success!'
      else
        render 'new'
      end
    end

    # edit: 0.0.0.0:3000/users/:id (patch)
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

    # delete user: 0.0.0.0:3000/users/:id (delete)
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url, notice: 'User was successfully deleted.'
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
