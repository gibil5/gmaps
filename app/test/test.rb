

def do_test

	#positions = @map.points.as_json
	positions = [
		{:name => 'Javier', :lat_dec => '10.0', :lng_dec => '11.0'},
		{:name => 'Jeff',   :lat_dec => '20.0', :lng_dec => '21.0'}
		#{"name" => 'Javier', "lat_dec" => '10.0', "lng_dec" => '11.0'},
		#{"name" => 'Jeff',   "lat_dec" => '20.0', "lng_dec" => '21.0'},

		#{"id"=>13, "name"=>"Tai-i Vegetariano", "map_id"=>1, "lat_dec"=>"-12.112992", "lng_dec"=>"-77.028803", "point_type"=>"restaurant"},
		#{"id"=>12, "name"=>"Sabor y Vida", "map_id"=>1, 	 "lat_dec"=>"-12.12196", "lng_dec"=>"-77.03372", "point_type"=>"restaurant"},
		#{"id"=>11, "name"=>"El Paraiso Bio Leben", "map_id"=>1, "lat_dec"=>"-12.12409", "lng_dec"=>"-77.02875", "point_type"=>"restaurant"}
	]

    pos_arr = []
	
	positions.each do |p| 
    	pos = {}
		
		puts p
		#puts 
		#puts p[:name]
		#puts p['lat_dec']

    	pos[:lat] = p[:lat_dec]
    	pos[:lng] = p[:lng_dec]
    	#pos[:lat] = p["lat_dec"]
    	#pos[:lng] = p["lng_dec"]

    	puts pos
    	puts
    	pos_arr << pos 
    	#puts pos_arr
    end

    puts
    puts 'positions'
    puts positions
    puts 'pos_arr'
    puts pos_arr 
end

do_test
