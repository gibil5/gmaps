
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

    @map = Map.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])

    @points = @map.points.paginate(page: params[:page])

    positions = @map.points.as_json

    pos_arr = []



    #img_res = "/assets/restaurant_vegetarian_green_1.png"
    #img_med = "/assets/meditation_blue_1.png"  
    #img_mar = "/assets/market_yellow_1.png"  

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

      #if p["point_type"] == 'restaurant'
      #  img = img_res
      #end
      #if p["point_type"] == 'meditation'
      #  img = img_med
      #end
      #if p["point_type"] == 'market'
      #  img = img_mar
      #end

      img = img_h[p["point_type"]]

      pos["picture"] = {
        #{}"url" => "/assets/restaurant_vegetarian_green_1.png",
        "url" => img,
        "width" =>  width,
        "height"=> height
      }

      #name: 'Foo', 
      #infowindow: "I'm Foo"
      pos_arr << pos 
    end


    gon.pos = pos_arr
    puts 'MARK: pos_arr'
    puts pos_arr


    #[ 
    #  { lat: -12.0, lng: -77.0},
    #  { lat: -12.1, lng: -77.6},
    #  { lat: -12.3, lng: -77.1}
    #]
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
