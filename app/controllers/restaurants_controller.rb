
class RestaurantsController < ApplicationController


  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to restaurants_url
  end



  def index
    #@restaurants = Restaurant.all
    #@restaurants = Restaurant.paginate(page: params[:page])
    #@restaurants = Restaurant.all.group_by{|u| u.name}

    @restaurants = Restaurant.order(:name).paginate(page: params[:page])
  end


  def edit
    @restaurant = Restaurant.find(params[:id])
  end


  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = "Profile updated"
      redirect_to @restaurant
    else
      render 'edit'
    end
  end





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
      #params.require(:restaurant).permit(:name, :info, :lat_dec, :long_dec)
      params.require(:restaurant).permit(:id, :name, :info, :lat_dec, :long_dec)
    end

end
