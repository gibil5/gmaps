
# jr@oblique:  12/9/14


class MapsController < ApplicationController


  def new
  	@map = Map.new
  end



  def create
  	@map = Map.new(map_params)

    # Load the points 
    @points = Point.find_by(map_type: "restaurants")

    if @map.save
      flash[:success] = "Welcome to the Sample App!"
    else
      render 'new'
    end
  end



  def show
    @map = Map.find(params[:id])
  end
 


 private

    def map_params
      #params.require(:map).permit(:name, :info, :lat_dec, :long_dec)
      params.require(:map).permit(:name, :map_type, :created_by, :last_updated_by, :comments)
    end


end