
class RestaurantsController < ApplicationController


  def show
    @restaurant = Restaurant.find(params[:id])
  end
 

  def new
  	@restaurant = Restaurant.new
  end


  def create
  	@restaurant = Restaurant.new(restaurant_params)
    
    if @restaurant.save
      #sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      #redirect_to @user
    else
      render 'new'
    end
  end



  private
  
    def restaurant_params
      params.require(:restaurant).permit(:name, :info, :lat_dec, :long_dec)
    end

end
