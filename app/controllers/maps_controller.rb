
# jr@oblique:  1/10/14


class MapsController < ApplicationController



# NEW 
  def new
    @map = Map.new
    #value = "0"
    #@types = [:restaurant => value, :meditation => value, :market => value]
  end



# CREATE 
  def create
    puts
    puts 'jx : CREATE'
    #puts map_params
    puts

  # New 
  	@map = Map.new(map_params)

    # Default values     
    map_type = 0
    created_by = 'Justino'
    last_updated_by = 'Javier'
    comments = 'no comments'


  # Initialize
    @points = []
    #puts 'points.count'
    #puts @points.count
    #puts 
    pts = {}


    type_mar = map_params['map_type_mar'] == '1'
    type_med = map_params['map_type_med'] == '1'
    type_res = map_params['map_type_res'] == '1'

    type_yog = map_params['map_type_yog'] == '1'
    type_eve = map_params['map_type_eve'] == '1'
    type_all = map_params['map_type_all'] == '1'



  # Read from Database 
    #if map_params['map_type_mar'] == '1'  
    if type_mar or type_all
      puts 'Type Market'
      pts[:market] = Restaurant.where("point_type = 'market'").as_json
      @points = @points + pts[:market] 
      map_type = map_type +1
    end

    #if map_params['map_type_med'] == '1' 
    if type_med or type_all
      puts 'Type Meditation'
      pts[:meditation] = Restaurant.where("point_type = 'meditation'").as_json
      @points = @points + pts[:meditation] 
      map_type = map_type +10
    end

    #if map_params['map_type_res'] == '1'     
    if type_res or type_all     
      puts 'Type Restaurant'
      pts[:restaurant] = Restaurant.where("point_type = 'restaurant'").as_json
      @points = @points + pts[:restaurant] 
      map_type = map_type +100
    end

    #if map_params['map_type_yog'] == '1' 
    if type_yog or type_all 
      puts 'Type Yoga'
      pts[:market] = Restaurant.where("point_type = 'yoga'").as_json
      @points = @points + pts[:market] 
      map_type = map_type +1000
    end

    #if map_params['map_type_eve'] == '1' 
    if type_eve or type_all 
      puts 'Type Event'
      pts[:market] = Restaurant.where("point_type = 'event'").as_json
      @points = @points + pts[:market] 
      map_type = map_type +10000
    end





    @map.map_type = map_type
    @map.created_by = created_by
    @map.last_updated_by = last_updated_by
    @map.comments = comments

   

    #@points = pts[:restaurant] + pts[:meditation] + pts[:market]

    puts 'jx: points.count'
    puts @points.count
    puts 

    
    if @map.save
      flash[:success] = "Map created"
      
      @points.each do |p|
        p["id"] = nil 
        @map.points.create!(p)
        #puts p
        #puts
      end 
    else
      render 'new'
    end

  end




# INDEX
  def index
    #@points = point.all
    #@points = point.paginate(page: params[:page])
    #@points = point.all.group_by{|u| u.name}

    #@maps = Map.order(:name).paginate(page: params[:page])
    @maps = Map.paginate(page: params[:page])
  end







# SHOW
  def show
    puts
    puts 'jx : SHOW'


# Microcomment
    #@micropost = current_user.microposts.build if signed_in?
    @microcomment = Microcomment.new

    #@feed_items = current_user.feed.paginate(page: params[:page])
    #@feed_items = Microcomment.where("owner = 'javier' ")
    #@feed_items = Microcomment.where("owner = 'javier' ")
    @feed_items = Microcomment.all




# Map
    @map = Map.find(params[:id])

# Currentmap 
    if Currentmap.count == 0
      c = Currentmap.new(id_curr: 0)
      c.save 
    end
    current_map = Currentmap.first
    current_map.id_curr = @map.id
    current_map.save 


    





    #@microposts = @user.microposts.paginate(page: params[:page])

    @points = @map.points.paginate(page: params[:page]).order(:name)


# Separate by group 
    #x_pos = @map.points.as_json
    x_pos = @map.points.order(:name)
    @x_restaurant = x_pos.select{ |item| item["point_type"] == "restaurant" }.sort{|a,b| a['name']<=>b['name']}
    @x_meditation = x_pos.select{ |item| item["point_type"] == "meditation" }.sort{|a,b| a['name']<=>b['name']}

    @x_yoga =       x_pos.select{ |item| item["point_type"] == "yoga" }.sort{|a,b| a['name']<=>b['name']}
    @x_market =     x_pos.select{ |item| item["point_type"] == "market" }.sort{|a,b| a['name']<=>b['name']}
    @x_event =      x_pos.select{ |item| item["point_type"] == "event" }.sort{|a,b| a['name']<=>b['name']}

    @points_res = @x_restaurant
    @points_med = @x_meditation
    @points_mar = @x_market
    @points_yog = @x_yoga
    @points_eve = @x_event



# Create array for Google Map 
    positions = @map.points.as_json

    pos_arr = []

    img_h = {
              #"restaurant" =>   "/assets/restaurant_vegetarian_green_1.png",
              #"meditation" =>   "/assets/meditation_blue_1.png",
              #"market" =>       "/assets/market_yellow_1.png",  
              "restaurant" =>   "/assets/restaurant.png",
              "meditation" =>   "/assets/meditation.png",
              "market" =>       "/assets/market.png", 

              "yoga" =>         "/assets/yoga.png",
              "event" =>        "/assets/event.png",
              #{}"" =>      "/assets/.png"
              #{}"" =>      "/assets/.png",

            }

    width = 36
    height = 36
    positions.each do |p| 
      pos = {}
      pos["lat"] = p["lat_dec"]
      pos["lng"] = p["lng_dec"]
      pos["name"] = p["name"]
      pos["infowindow"] = p["name"]


      img = img_h[p["point_type"]]

      pos["picture"] = {
        #{}"url" => "/assets/restaurant_vegetarian_green_1.png",
        "url" => img,
        "width" =>  width,
        "height"=> height
      }

      pos_arr << pos 
    end


    gon.pos = pos_arr
    puts 'MARK: pos_arr'
    puts pos_arr

  end



# DESTROY
  def destroy
    Map.find(params[:id]).destroy
    flash[:success] = "Map deleted."
    redirect_to maps_url
  end


 private

    def map_params
      #params.require(:map).permit(:name, :info, :lat_dec, :long_dec)
      #params.require(:map).permit(:name, :map_type, :created_by, :last_updated_by, :comments)
      #params.require(:map).permit(:name, :map_type, :created_by, :last_updated_by, :comments, :map_type_res, :map_type_mar, :map_type_med)
      params.require(:map).permit(:name, :map_type, :created_by, :last_updated_by, :comments, 
                                  :map_type_res, :map_type_mar, :map_type_med, 
                                  :map_type_yog, :map_type_eve, :map_type_all)
    end


end
