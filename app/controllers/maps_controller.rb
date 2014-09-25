
# jr@oblique:  21/9/14


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

  	@map = Map.new(map_params)
    
    map_type = 0
    created_by = 'Justino'
    last_updated_by = 'Javier'
    comments = 'no comments'


    @points = []
    puts 'points.count'
    puts @points.count
    puts 
 
    pts = {}


    if map_params['map_type_mar'] == '1' 
      puts 'markets type'
      #@points = Restaurant.find_by(map_type: "restaurants")
      pts[:market] = Restaurant.where("point_type = 'market'").as_json

      @points = @points + pts[:market] 
      map_type = map_type +1
    end

    if map_params['map_type_med'] == '1' 
      puts 'meditation type'      
      pts[:meditation] = Restaurant.where("point_type = 'meditation'").as_json

      @points = @points + pts[:meditation] 
      map_type = map_type +10
    end

    if map_params['map_type_res'] == '1'     
      puts 'resto type'
      pts[:restaurant] = Restaurant.where("point_type = 'restaurant'").as_json

      @points = @points + pts[:restaurant] 
      map_type = map_type +100
    end


    @map.map_type = map_type
    @map.created_by = created_by
    @map.last_updated_by = last_updated_by
    @map.comments = comments

   

    #@points = pts[:restaurant] + pts[:meditation] + pts[:market]

    puts 'points.count'
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
    
    if Currentmap.count ==0
      c = Currentmap.new(id_curr: 0)
      c.save 
    end
    current_map = Currentmap.first
    current_map.id_curr = @map.id
    current_map.save 





    #@microposts = @user.microposts.paginate(page: params[:page])

    @points = @map.points.paginate(page: params[:page]).order(:name)

# Separate 
    #x_pos = @map.points.as_json
    x_pos = @map.points.order(:name)

    @x_restaurant = x_pos.select{ |item| item["point_type"] == "restaurant" }.sort{|a,b| a['name']<=>b['name']}

    @x_meditation = x_pos.select{ |item| item["point_type"] == "meditation" }.sort{|a,b| a['name']<=>b['name']}

    
    @points_r = @x_restaurant
    @points_m = @x_meditation



    positions = @map.points.as_json

    pos_arr = []

    img_h = {
              "restaurant" =>  "/assets/restaurant_vegetarian_green_1.png",
              "meditation" =>  "/assets/meditation_blue_1.png",
              "market" =>      "/assets/market_yellow_1.png"  
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
      params.require(:map).permit(:name, :map_type, :created_by, :last_updated_by, :comments, :map_type_res, :map_type_mar, :map_type_med)
    end


end
