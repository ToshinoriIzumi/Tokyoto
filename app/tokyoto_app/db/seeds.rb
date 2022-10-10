table_names = [
  'supports',
  'cities',
  'income',
  'statuses',
  'age',
  'benefit',
  'conditions_support',
  'hospitals'
]

begin
  table_names.each do |table_name|
    path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

    if File.exists?(path)
      puts "Creating #{table_name}.rb..."
      require path
    end

rescue => e
  puts e.message
  ActiveRecord::Rollback
end
