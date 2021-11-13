table_names = %w(
  schools subjects parent_members staff_members student_members semesters periods goal_sheets 
  textbooks daily_sheets notifications events examinations score_sheets scores
)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

  # ファイルが存在しない場合はdevelopmentディレクトリを読み込む
  path = path.sub(Rails.env, "development") unless File.exist?(path)

  puts "#{table_name}..."
  require path
end