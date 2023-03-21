class ProfilesController < ApplicationController
  before_action :set_cities, only: [:new, :create, :edit, :update]
  before_action :set_births, only: [:create, :update]
  before_action :set_child_situation, only: [:new, :edit]
  before_action :set_public_assistance_situation, only: [:new, :edit]
  before_action :set_dependency_situation, only: [:new, :edit]

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
    if current_user.city_id.present?
      @city = City.find(current_user.city_id)
    else
      redirect_to new_profile_path, alert: 'プロフィール情報を登録してください。'
    end

    @supports = SupportsSearchService.search_by(
      current_user.family_situations.find_by("situation like '生活保護%'").situation,
      current_user.family_situations.find_by("situation like '%子'").situation,
      current_user.city_id
    )
    
  end
  
  def edit
    user = current_user
    @births = []
    user.children.each do |child|
      @births.push(child.birth)
    end
    
    @profile_form = ProfileForm.new(
      id: user.id,
      city_id: user.city_id,
      income: user.income,
      births: @births,
      public_assistance_situation: current_user.retrieve_public_assistance_situation,
      dependency_situation: current_user.retrieve_dependency_situation,
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
    params.require(:profile_form).permit(
      :city_id,
      :income,
      { births: [] },
      :public_assistance_situation,
      :dependency_situation
    )
  end

  def set_public_assistance_situation
    @public_assistance_situations = FamilySituation.load_public_assistance_situation
  end

  def set_dependency_situation
    @dependency_situations = FamilySituation.load_dependency_situation
  end

  def set_child_situation
    @child_situations = FamilySituation.load_child_situation
  end

  def set_cities
    @cities = City.all
  end

  def set_births
    @births = profile_params[:births]
  end

end
