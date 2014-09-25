
# jr@oblique:  25/9/14


class Microcomment < ActiveRecord::Base

	# Validation block 
  	validates :owner,  presence: true    #, length: { maximum: 50 } 
  	validates :content,  presence: true  #, length: { maximum: 500 } 
end
