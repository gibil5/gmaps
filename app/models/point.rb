

class Point < ActiveRecord::Base
  self.inheritance_column = nil
  

  belongs_to :map
  
  default_scope -> { order('created_at DESC') }

  validates :name, presence: true, length: { maximum: 140 }
  validates :map_id, presence: true

end
