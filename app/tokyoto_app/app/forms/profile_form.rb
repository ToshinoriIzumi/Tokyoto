class ProfileForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :integer
  attribute :user_name, :string
  attribute :city_id, :integer
  attribute :income, :integer
  attribute :age, :integer

  # バリデーション他に付けたほうが良いものあるか？
  validates :city_id, presence: true
  validates :income, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  #persisted?は作成・更新に応じてフォームのアクションをPOST・PATCHに切り替えてくれる
  # delegate :persisted?, to: :profile

  def save
    user = User.find(id) # find_byのほうが良い？
    user.update(user_name: user_name, city_id: city_id, income: income)

    if user.children.present?
      Child.where(user_id: id).update(age: age)
    else
      Child.create!(age: age, user_id: id)
    end
  end

  # profile_pathやprofile_path(id)を切り替えるためのメソッド
  # def to_model
  #   profile
  # end
end
