class ProfilesController < ApplicationController
  def new
    @profile_form = ProfileForm.new
    @cities = City.all
  end

  def create
    @profile_form = ProfileForm.new(profile_params)
    @profile_form.id = current_user.id
    if @profile_form.save
      redirect_to root_path, notice: 'プロフィールを登録しました。'
    else
      flash.now[:alert] = 'プロフィールを登録できませんでした。'
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
    @profile_form = ProfileForm.new(id: @user.id)
    @city = City.find(current_user.city_id)
  end

  def edit
    user = current_user
    @profile_form = ProfileForm.new(id: user.id, user_name: user.user_name, city_id: user.city_id, income: user.income, age: user.children[0].age)
    @cities = City.all
  end

  def update
    @profile_form = ProfileForm.new(profile_params)
    @profile_form.id = current_user.id
    @profile_form.save
    redirect_to profile_path
  end

  private

  def profile_params
    params.require(:profile_form).permit(:user_name, :city_id, :income, :age)
  end
end
