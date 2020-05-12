class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    unless @user == current_user || current_user.admin? 
      redirect_to wines_path, notice: '他の人のページへアクセスは出来ません!'
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end
end