

class Map < ActiveRecord::Base

  #has_many :points
  has_many :points, dependent: :destroy






end
