class ProfileForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :integer
  # attribute :user_name, :string
  attribute :city_id, :integer
  attribute :income, :integer
  attribute :births
  attribute :public_assistance_situation, :string #生活保護
  attribute :dependency_situation, :string #扶養人数状況

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

    begin
      ActiveRecord::Base.transaction do
        user.update(city_id: city_id, income: income)
        if user.children.present?
          Child.where(user_id: id).destroy_all
          create_children
        else
          create_children
        end

        if user.user_family_situations.present?
          UserFamilySituation.where(user_id: id).destroy_all
          create_user_family_situation(user)
        else
          create_user_family_situation(user)
        end
      end
    rescue  => e
      ActiveRecord::Rollback
      return false
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

  def create_user_family_situation(user)
    situations = [
      public_assistance_situation.to_i,
      dependency_situation.to_i,
    ]

    child_situation = ''
    if births.size == 1 || births.size == 2
      child_situation = '第' + births.size.to_s + '子'
    else
      child_situation = '第3子以降'
    end

    situations.push(
      FamilySituation.find_by(situation: child_situation).id.to_s
    )

    family_situations = []
    situations.each do |situation|
      family_situations.push(
        {
          user_id: user.id,
          family_situation_id: situation,
          created_at: Time.now,
          updated_at: Time.now
        }
      )
    end
    UserFamilySituation.insert_all(family_situations)
  end
end
