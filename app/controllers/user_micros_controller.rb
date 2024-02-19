class UserMicrosController < ApplicationController

include Initializable

  def show
    # query for current user
    @user = User.find_by(id: params[:user_id])

    # get wordcross_date from params or default to today in user's timezone (see Initializable concern)
    wordcross_date = params[:wordcross_date] || wordcross_date_from_timezone(timezone: @user.timezone)

    # query for micro by date
    @micro = Micro.find_by(wordcross_date: wordcross_date)

    # query for user_micros that match by micro_id && user_id
    @user_micro = UserMicro.find_by(user_id: @user.id, micro_id: @micro.id)

    # if user_micro does not exist, create a new one from micro
    if !@user_micro
      @user_micro = UserMicro.new(
        micro_id: @micro.id,
        icon: 1,
        solved: false,
        user_id: @user.id,
        wordcross_date: @micro.wordcross_date,
        timer: [0, 0, 0],
        solving_state: init_grid_state(@micro.solution) # see Initializable concern
      )
    end

    # persist user_micro to db and render user_micro data to frontend as JSON
    if @user_micro.save
      render :show
    else
      errors = @user_micro.errors.full_messages
      render json: errors, status: 401
    end
  end

  def update
    # query for user_micro by id
    @user_micro = UserMicro.find(params[:id])

    # get micro
    @micro = Micro.find_by(id: @user_micro.micro_id)
    update_data = user_micro_params
    # ! CHECK THIS - why is solving_state passed in params as an object needing to be converted to an array? !
    update_data[:solving_state] = update_data[:solving_state].values

    # persist user_micro with updated solving_state to db and render user_micro data to frontend as JSON
    if @user_micro.update(update_data)
      render :show
    else
      errors = @user_micro.errors.full_messages
      render json: errors, status: 401
    end
  end

  private

  def user_micro_params
    params.require(:user_micro).permit(
      :id,
      :micro_id,
      :icon,
      :solved,
      :user_id,
      :wordcross_date,
      timer: [],
      solving_state:{}
      )
  end
end
