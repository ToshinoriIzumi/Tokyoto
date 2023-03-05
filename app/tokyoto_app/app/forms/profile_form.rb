class ProfileForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :integer
  # attribute :user_name, :string
  attribute :city_id, :integer
  attribute :income, :integer
  attribute :births
  attribute :public_assistance_stuation, :string #生活保護
  attribute :dependency_stuation, :string #扶養人数状況

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
    if user.children.present?
      Child.where(user_id: id).destroy_all
      create_children
    else
      create_children
    end

    if user.user_family_stuations.present?
      UserFamilyStuation.where(user_id: id).destroy_all
      create_user_family_stuation(user)
    else
      create_user_family_stuation(user)
    end
  end
  
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

  def create_user_family_stuation(user)
    stuations = [
      public_assistance_stuation.to_i,
      dependency_stuation.to_i,
    ]

    child_stuation = ''
    if births.size == 1 || births.size == 2
      child_stuation = '第' + births.size.to_s + '子'
    else
      child_stuation = '第3子以降'
    end

    stuations.push(
      FamilyStuation.find_by(stuation: child_stuation).id.to_s
    )

    family_stuations = []
    stuations.each do |stuation|
      family_stuations.push(
        {
          user_id: user.id,
          family_stuation_id: stuation,
          created_at: Time.now,
          updated_at: Time.now
        }
      )
    end
    UserFamilyStuation.insert_all(family_stuations)
  end
end
