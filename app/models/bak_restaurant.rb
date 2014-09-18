
# jr@oblique:  10/9/14


class Restaurant < ActiveRecord::Base

	# Validation block 
  	validates :name,  presence: true, length: { maximum: 50 } 
  	validates :info,  presence: true, length: { maximum: 50 } 
  	validates :lat_dec,  presence: true, length: { maximum: 50 } 
  	validates :long_dec,  presence: true, length: { maximum: 50 } 

  	# email: using a regular expression to validate format 
  	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	#validates :email, 
  	#		presence: true, 
  	#		format: { with: VALID_EMAIL_REGEX },
    #       uniqueness: { case_sensitive: false }

  	#has_secure_password
  	#validates :password, length: { minimum: 6 } 



end
