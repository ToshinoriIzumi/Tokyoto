class ProfileForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend Enumerize

  attribute :id, :integer
  # attribute :user_name, :string
  attribute :city_id, :integer
  attribute :income, :integer
  attribute :births
  attribute :is_welfare, :boolean #生活保護
  enumerize :number_of_dependents, in: %w(one two three_than) #扶養人数

  # バリデーション他に付けたほうが良いものあるか？
  validates :city_id, presence: true
  #validates :user_name, presence: true
  validates :income, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :births, presence: true

  #persisted?は作成・更新に応じてフォームのアクションをPOST・PATCHに切り替えてくれる
  # delegate :persisted?, to: :profile

  def save
    user = User.find(id) # find_byのほうが良い？
    return false if invalid?
    user.update(city_id: city_id, income: income)
    if user.user_statuses.present?
      UserStatus.where(user_id: id).destroy_all
      create_user_status(user)
    else
      create_user_status(user)
    end
    if user.children.present?
      Child.where(user_id: id).destroy_all
      create_children
      create_user_child_status(user)
    else
      create_children
      create_user_child_status(user)
    end
  end
  
  # profile_pathやprofile_path(id)を切り替えるためのメソッド
  # def to_model
  #   profile
  # end
  private

  def create_children
    children = []
    births.each_with_index do |birth, i|
      next if birth.empty?
      children.push(
        {
          birth: birth,
          sibling_composition: i,
          user_id: id,
          created_at: Time.now,
          updated_at: Time.now
        }
        )
      end
      Child.insert_all(children)
    end

    def create_user_child_status(user)
      if births.length === 1
        child_status = 14
      elsif births.length === 2
        child_status = 15
      elsif births.length >= 3
        child_status = 16
      end
      user.user_statuses.create(is_status: child_status)
    end
    
    def create_user_status(user)
      welfare = is_welfare ? 5 : 18
      if number_of_dependents == 'one'
        dependents = 19
      elsif number_of_dependents == 'two'
        dependents = 20
      else number_of_dependents == 'three_than'
        dependents = 21
      end
      user.user_statuses.create(is_status: welfare)
      user.user_statuses.create(is_status: dependents)
    end
  end
