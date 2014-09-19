
# jr@oblique:  16/9/14


class MapsController < ApplicationController



# NEW 
  def new
    @map = Map.new

    #value = "0"
    #@types = [:restaurant => value, :meditation => value, :market => value]

  end



# CREATE 
  def create
    puts 'jx: create'
    #puts map_params
    puts

  	@map = Map.new(map_params)
    #@points = Point.find_by(map_type: "restaurants")
    

    @points = []
    puts @points.count
    puts 
    if map_params['map_type'] == '1' 
      puts 'resto type'
      
      #@points = Restaurant.all.as_json
      @points << Restaurant.all.as_json    
    end
    puts @points.count
    puts 
    

    if map_params['created_by'] == '1' 
      puts 'meditation type'
      
      @points << Meditation.all.as_json    
    end
    puts @points.count
    puts 
    

    if map_params['comments'] == '1' 
      puts 'markets type'
      @points << Market.all.as_json    
    end

    puts @points.count
    puts 

    #@points = Restaurant.where("point_type = 'restaurant'").as_json
    
    #if @map.save
    #  flash[:success] = "Map created"
      
    #  @points.each do |p|
    #    p["id"] = nil 
        #puts p["id"]
        #puts p
        #puts
    #    @map.points.create!(p)
        #puts
    #  end 
    #else
    #  render 'new'
    #end

  end




# INDEX
  def index
    #@points = point.all
    #@points = point.paginate(page: params[:page])
    #@points = point.all.group_by{|u| u.name}
    @maps = Map.order(:name).paginate(page: params[:page])
  end



# DESTROY
  def destroy
    Map.find(params[:id]).destroy
    flash[:success] = "Map deleted."
    redirect_to maps_url
  end




# SHOW
  def show

    puts 'jx : create'

    @map = Map.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
    @points = @map.points.paginate(page: params[:page])

    positions = @map.points.as_json

    pos_arr = []

    positions.each do |p| 
      pos = {}
      pos["lat"] = p["lat_dec"]
      pos["lng"] = p["lng_dec"]
      pos["name"] = p["name"]
      pos["infowindow"] = p["name"]
      #name: 'Foo', 
      #infowindow: "I'm Foo"
      pos_arr << pos 
    end

    gon.pos = pos_arr

    #[ 
    #  { lat: -12.0, lng: -77.0},
    #  { lat: -12.1, lng: -77.6},
    #  { lat: -12.3, lng: -77.1}
    #]
  end





 private

    def map_params
      #params.require(:map).permit(:name, :info, :lat_dec, :long_dec)
      params.require(:map).permit(:name, :map_type, :created_by, :last_updated_by, :comments)
    end


end
