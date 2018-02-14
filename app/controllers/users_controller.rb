class UsersController < ApplicationController
  def show
    @user = current_user
    @cocktails = @user.cocktails.includes(:ingredients, :doses)
    authorize @user
  end
end
