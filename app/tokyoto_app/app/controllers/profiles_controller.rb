class ProfilesController < ApplicationController
  before_action :set_user

  def show; end
  
  def edit
    @cities = City.all
  end
  
  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'プロフィールを更新しました'
    else
      flash.now[:alert] = 'プロフィールを更新できませんでした'
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find(current_user.id)
    @children = Child.where(user_id: @user.id)
    @city = City.find_by(id: @user.city_id)
  end

  def user_params
    params.require(:user).permit(:user_name, :income, :city_id, children_attributes: [:age, :id])
  end
end
