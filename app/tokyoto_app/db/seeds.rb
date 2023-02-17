table_names = [
  'supports',
  'cities',
  'income',
  'statuses',
  'age',
  'conditions',
  'conditions_supports',
  'hospitals',
  'tags',
  'supports_tags',
  'conditions_supports_incomes',
  'conditions_supports_statuses',
]

begin
  ActiveRecord::Base.transaction do
    table_names.each do |table_name|
      path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

      if File.exists?(path)
        puts "Creating #{table_name}.rb..."
        require path
      end
    end
  end

rescue  => e
  puts e.message
  ActiveRecord::Rollback
end
