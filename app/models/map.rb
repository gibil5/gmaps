

class Map < ActiveRecord::Base
  attr_accessor :map_type_res, :map_type_med, :map_type_mar


  #has_many :points
  has_many :points, dependent: :destroy

end
