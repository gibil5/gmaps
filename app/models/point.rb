

class Point < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :map
  default_scope -> { order('created_at DESC') }


  validates :name, presence: true, length: { maximum: 140 }
  validates :map_id, presence: true
  validates :point_type, presence: true
  validates :info, presence: true
  validates :lat_dec, presence: true
  validates :lng_dec, presence: true
  validates :created_by, presence: true
  validates :last_updated_by, presence: true

end
