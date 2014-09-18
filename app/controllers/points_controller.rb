
# jr@oblique:  15/9/14


class PointsController < ApplicationController
  

  def index
    #@points = point.all
    #@points = point.paginate(page: params[:page])
    #@points = point.all.group_by{|u| u.name}
    @points = Point.order(:name).paginate(page: params[:page])
  end



  def new
  	@point = Point.new
  end


def create
    
  	@point = Point.new(point_params)    
    
    if @point.save
      #sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      #redirect_to @user
    else
      render 'new'
    end
  end


private  
    def point_params
      params.require(:point).permit(:name, :point_type, :info, :lat_dec, :lng_dec, :created_by, :last_updated_by)
      #params.require(:point).permit(:id, :name, :info, :lat_dec, :long_dec)
    end


end
