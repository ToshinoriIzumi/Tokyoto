class ProfilesController < ApplicationController
  include ApplicationHelper
  before_action :set_user, only: [:show, :edit, :update, :user_supports]

  def new
    @user = User.new
    @user.children.build
    @cities = City.all
  end

  def create
    @user = current_user
    if @user.update(profile_params)
      redirect_to root_path, notice: 'プロフィール情報を登録しました。'
    else
      flash.now[:alert] = 'プロフィール情報の登録に失敗しました。'
    end
  end

  def show; end

  def edit
    @cities = City.all
  end

  def update
    if @user.update(profile_params)
      redirect_to profile_path, notice: 'プロフィールを更新しました'
    else
      flash.now[:alert] = 'プロフィールを更新できませんでした'
      render :edit
    end
  end

  def user_supports
    @user_supports = ConditionsSupport.joins(:income, :age).where(city_id: @user.city_id, incomes: { money: @user.income..}, ages: {min: ..@user.children.first.age, max: @user.children.first.age..})
  end

  private

  def set_user
    @user = User.find(current_user.id)
    @user.income = income_to_view(@user.income)
    @children = Child.where(user_id: @user.id)
    @city = City.find_by(id: @user.city_id)
  end

  def profile_params
    profile_params = params.require(:user).permit(:user_name, :income, :city_id, children_attributes: [:age])
    profile_params[:income] = income_to_db(profile_params[:income])

    return profile_params
  end
end
