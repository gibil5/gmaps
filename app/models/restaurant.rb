
# jr@oblique:  3/10/14


class Restaurant < ActiveRecord::Base

# Validation block 
  #validates :map_id, presence: true
  validates :point_type, presence: true
  #validates :point_subtype, presence: true

  validates :name, presence: true, length: { maximum: 140 }
  #validates :info, presence: true
  validates :lat_dec, presence: true
  validates :lng_dec, presence: true
  validates :created_by, presence: true
  validates :last_updated_by, presence: true

  #validates :ad_number,     presence: true
  #validates :ad_street,     presence: true
  #validates :ad_district,   presence: true
  #validates :ad_phone_1,    presence: true
  #validates :ad_phone_2,    presence: true
  #validates :ad_reference,  presence: true

  #validates :open_hours,    presence: true
      
  #validates :email,         presence: true
  #validates :www,           presence: true
  #validates :facebook,      presence: true
  #validates :twitter,       presence: true
      
  #validates :comments,      presence: true	

end
