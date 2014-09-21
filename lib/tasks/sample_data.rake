
# jr@oblique: 18/9/14

#:name
#:map_id
#:point_type
#:info
#:lat_dec
#:lng_dec
#:created_by
#:last_updated_by



namespace :db do

    require 'spreadsheet'

  desc "Fill database with sample data"


  task jr_res_populate: :environment do

    puts 'test spreadsheet...'
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open 'app/assets/xls/restaurants.xls'
    puts book 
    
    sheet_name = ENV['SNAME']

    #sheet1 = book.worksheet 'Restaurant'    
    sheet1 = book.worksheet sheet_name
    puts sheet_name    

    f = sheet1.row(0)
    ctr = 0

    sheet1.each do |row|
      x = 0
      p = {}

      row.each do |field|
        p[f[x]] = row[x]
        x += 1
      end

      name =        p['name']
      map_id =      nil
      point_type =  p['point_type']
      info =        p['info']
      lat_dec =     p['lat_dec']
      lng_dec =     p['lng_dec']
      created_by =  p['created_by']
      last_updated_by = p['last_updated_by']

      if (ctr > 0) and ( (lat_dec != 'na') and (lng_dec != 'na') ) 
        Restaurant.create!(  
                          name: name,
                          map_id: map_id,
                          point_type: point_type, 
                          info: info,
                          lat_dec: lat_dec,
                          lng_dec: lng_dec, 
                          created_by: created_by, 
                          last_updated_by: last_updated_by
                          )
      end
      ctr += 1


    end
  end



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

