


class Microcomment < ActiveRecord::Base

	# Validation block 
  	validates :owner,  presence: true, length: { maximum: 50 } 
  	validates :content,  presence: true, length: { maximum: 500 } 
end
