module ProfileFormHelper
  def show_user_name
    @user.user_name if @user.user_name
  end

  def show_city_name
    @city.city_name if @user.city_id
  end

  def show_income
    @user.income if @user.income
  end

  def show_children_age
    if @user.children
      @user.children.each do |child|
        child.age
      end
    end
  end
end