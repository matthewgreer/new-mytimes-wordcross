class Api::UsersController < ApplicationController

  before_action :require_logged_in!, except: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      render"api/users/show"
    else
      errors = @user.errors.full_messages || []

      # custom error messaging here?

      render json: {
        messages: errors,
        email: params[:user][:email]
      }, status: 422
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :show
    else
      errors = @user.errors.full_messages
      render json: errors, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :email,
      :password,
      :timezone,
      :last_gold_star_date,
      :streak
    )
  end
end
