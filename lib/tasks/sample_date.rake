require 'faker'

namespace :db do
  desc "Fill database with sample teams data"
  task :fill_teams => :environment do
    #Rake::Task['db:reset'].invoke

	@countries = ["United States", "Canada", "United Kingdom", "Germany", "Mexico"]
	
    99.times do |n|
      name  = Faker::Name.last_name
	  country  = @countries.rand.to_s
	  stars = rand(5).to_s
	  division = rand(3).to_s

      Teams.create!(:name => name,
                   :country => country,
                   :stars => stars,
                   :division => division)
    end
  end
end
