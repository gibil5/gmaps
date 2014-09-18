
# jr@oblique:  16/9/14


class MapsController < ApplicationController


# SHOW
  def show
    @map = Map.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
    @points = @map.points.paginate(page: params[:page])
  end



# NEW 
  def new
    puts 'jx: new'
  	
    @map = Map.new
  end



# CREATE 
  def create
    puts 'jx: create'

  	@map = Map.new(map_params)
    #puts @map

    # Load the points 
    #@points = Point.find_by(map_type: "restaurants")
    #@points = Point.where("point_type = 'meditation'")
    #puts @points


    p = {
          name: "Photonika",
          point_type: "restaurant", info: "some info", 
          lat_dec: "-5.0", lng_dec: "-55.0",
          created_by: "javier", last_updated_by: "javier"
        }
    
    if @map.save

      flash[:success] = "Map created"
      
      @point = Point.first
      #p = map.points.build(@point.as_json)
      #p = @point.as_json
      puts 'jx'
      puts p
      #puts p[name] 
      #p.id = nil
      puts p
      @map.points.create!(p)
      #put @point.as_json 
 
    else
      render 'new'
    end

  end



 private

    def map_params
      #params.require(:map).permit(:name, :info, :lat_dec, :long_dec)
      params.require(:map).permit(:name, :map_type, :created_by, :last_updated_by, :comments)
    end


end
