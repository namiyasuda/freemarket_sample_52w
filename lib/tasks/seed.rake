Dir.glob(File.join(Rails.root, 'db', 'seeds', '*.rb')).each do |file|
  desc "db/seeds/ ディレクトリからシードデータを読み込む"
  task "db:seed:#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
    load(file)
  end
end
 