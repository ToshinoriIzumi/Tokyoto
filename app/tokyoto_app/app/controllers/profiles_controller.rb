class ProfilesController < ApplicationController
  before_action :set_cities, only: [:new, :create, :edit, :update]
  before_action :set_births, only: [:create, :update]

  def new
    @profile_form = ProfileForm.new
    @births = []
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
    @statuses = UserStatus.where(user_id: @user.id).pluck(:is_status).map{|s| Status.find(s)}
  end
  
  def edit
    user = current_user
    statuses_id = UserStatus.where(user_id: user.id).pluck(:is_status)
    statuses_id.each do |id|
      change_welfare(id)
    end
    statuses_id.each do |id|
      change_dependents(id)
    end
    @births = []
    user.children.each do |child|
      @births.push(child.birth)
    end
    
    @profile_form = ProfileForm.new(
      id: user.id,
      city_id: user.city_id,
      income: user.income,
      births: @births,
      is_welfare: @welfare,
      number_of_dependents: @dependents,
    )
  end

  def update
    @profile_form = ProfileForm.new(profile_params)
    @profile_form.id = current_user.id
    if @profile_form.save
      redirect_to profile_path, notice: 'プロフィールを更新しました。'
    else
      flash.now[:alert] = 'プロフィールを更新できませんでした。'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile_form).permit(:city_id, :income, { births: [] }, :is_welfare, :number_of_dependents)
  end

  def set_cities
    @cities = City.all
  end

  def set_births
    @births = profile_params[:births]
  end

  def change_welfare(id)
    if id === 5
      @welfare = true
    elsif id === 18
      @welfare = false
    end
  end

  def change_dependents(id)
    if id === 19
      @dependents = 'one'
    elsif id === 20
      @dependents = 'two'
    elsif id === 21
      @dependents = 'three_than'
    end
  end
end
