

class Map < ActiveRecord::Base
  #attr_accessor :map_type_res, :map_type_med, :map_type_mar
  attr_accessor :map_type_res, :map_type_med, :map_type_mar, :map_type_yog, :map_type_eve, :map_type_all
  #attr_accessor :map_type_h

  #attr_accessor :map_type_h['res'] 
  #attr_accessor :map_type_h #= {:res => '0'}


  #has_many :points
  has_many :points, dependent: :destroy

  #serialize :map_type


  #def initialize
  #	@map_type_h = {}
  #end 

end
