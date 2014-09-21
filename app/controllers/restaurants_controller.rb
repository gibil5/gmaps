
class RestaurantsController < ApplicationController


# NEW 
  def new
    @restaurant = Restaurant.new
  end

#:name
#:map_id
#:point_type
#:info
#:lat_dec
#:lng_dec
#:created_by
#:last_updated_by


# CREATE
  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.info = 'no info'
    @restaurant.created_by = 'Javier'
    @restaurant.last_updated_by = 'Javier'

    if @restaurant.save
      flash[:success] = "Restaurant created !"
      #redirect_to @user
    else
      render 'new'
    end
  end



# INDEX 
  def index
    #@restaurants = Restaurant.all
    #@restaurants = Restaurant.paginate(page: params[:page])
    #@restaurants = Restaurant.all.group_by{|u| u.name}

    #@restaurants = Restaurant.order(:name).paginate(page: params[:page])
    @restaurants = Restaurant.order(:point_type).order(:name).paginate(page: params[:page])
  end



# EDIT
  def edit
    @restaurant = Restaurant.find(params[:id])
  end



# DESTROY
  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to restaurants_url
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
 




  private
  
    def restaurant_params
      #params.require(:restaurant).permit(:name, :info, :lat_dec, :long_dec)
      #params.require(:restaurant).permit(:id, :name, :info, :lat_dec, :long_dec)
      params.require(:restaurant).permit(:name, :point_type, :info, :lat_dec, :lng_dec, :created_by, :last_updated_by)

    end

end
