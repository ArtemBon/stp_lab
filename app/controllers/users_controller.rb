class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to register_path, notice: "User was successfully created." and return if @user.save

    render :new, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
