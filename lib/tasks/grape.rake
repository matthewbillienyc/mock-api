namespace :grape do
  desc "routes"
  task :routes => :environment do
    MockAPI::Users.routes.map { |route| puts "#{route} \n" }
  end
end
