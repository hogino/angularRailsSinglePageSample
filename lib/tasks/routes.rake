# confirm command
# $ bin/rake api:routes
namespace :api do
  desc 'API Routes'
  task routes: :environment do
    Api.routes.each do |api|
      method = api.route_method.ljust(10)
      path = api.route_path.gsub(':version', api.route_version)
      puts "     #{method} #{path}"
    end
  end
end