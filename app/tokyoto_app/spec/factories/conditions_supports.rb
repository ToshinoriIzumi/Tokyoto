FactoryBot.define do
  factory :conditions_support do
    # これでええんか…？
    # https://swfz.hatenablog.com/entry/2019/01/27/102711
    id { [association :support, association :condition] }
    association :city
    association :income
    association :age
    payment { 100000 }
    dependents_num { 1 }
  end
end
