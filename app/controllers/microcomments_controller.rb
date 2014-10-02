

class MicrocommentsController < ApplicationController
  #before_action :signed_in_user



# CREATE
  def create
    #@micropost = current_user.microposts.build(micropost_params)
  	#@map = Map.new(map_params)
    @microcomment = Microcomment.new(microcomment_params)
    #@feed_items = current_user.feed.paginate(page: params[:page])
    #@feed_items = Microcomment.first


    #id = params["id"]
    id = Currentmap.first.id_curr

    if @microcomment.save
      flash[:success] = "Microcomment created!"
      #redirect_to root_url
      #redirect_to map_path(1)
    else
      #render 'static_pages/home'
      #redirect_to map_path(1)
    end
    redirect_to map_path(id)


  end


# DESTROY
  def destroy
  	id = params["id"]
  	@microcomment = Microcomment.find_by_id(id)
  	@microcomment.destroy
  	#id = @map.id
  	id = Currentmap.first.id_curr
    redirect_to map_path(id)
  end


  private 
    def microcomment_params
      params.require(:microcomment).permit(:content, :owner)
    end

end