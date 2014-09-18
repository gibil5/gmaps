
# jr@oblique: 18/9/14


namespace :db do

  desc "Fill database with sample data"
  task populate: :environment do


    #admin = User.create!(name: "Example User",
    #                     email: "example@railstutorial.org",
    #                     password: "foobar",
    #                     password_confirmation: "foobar",
    #                     admin: true)

    1.times do |n|
      name  = Faker::Name.name
      map_type = "restaurant"
      info = "some info"
      lat_dec = "-5.0"
      lng_dec = "-55.0"
      created_by = "javier"
      last_updated_by = "javier"
      comments = "no comments"

      Map.create!(  name: name,
                    map_type: map_type, 
                    created_by: created_by, 
                    last_updated_by: last_updated_by, 
                    comments: comments
                    )
    end


    # Microposts
    #users = User.all(limit: 6)
    #maps = Map.first(6)
    maps = Map.all
    #50.times do
    5.times do

      #content = Faker::Lorem.sentence(5)
      #users.each { |user| user.microposts.create!(content: content) }

      #name = Faker::Lorem.sentence(5)
      name  = Faker::Name.name
      maps.each { |map| map.points.create!(
                                            name: name,
                                            point_type: "restaurant", info: "some info", 
                                            lat_dec: "-5.0", lng_dec: "-55.0",
                                            created_by: "javier", last_updated_by: "javier"
                                          )}

    end
  end
end

