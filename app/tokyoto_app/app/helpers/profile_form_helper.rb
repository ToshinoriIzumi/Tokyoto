module ProfileFormHelper
  # def show_user_name
  #   @user.user_name if @user.user_name
  # end

  def show_city_name
    @city.city_name if current_user.city_id
  end

  def show_income
    current_user.income if current_user.income
  end

  def show_children_birth
    if current_user.children
      current_user.children.each do |child|
        child.birth
      end
    end
  end
end
