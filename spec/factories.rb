
# jr@oblique:  10/9/14


#FactoryGirl.define do
#  factory :restaurant do
#    name     	"Raw cafe"
#    info		"crudivegan"
#    lat_dec		"11"
#    long_dec	"21"
#  end
#end



FactoryGirl.define do

  factory :map do
    name     	"Restaurants"
    map_type 		"Test"
    created_by 	"Javier"
    last_updated_by 	"Javier"
    comments 	"Generated by Factory Girl"
  end

  factory :point do
    name "Photonika"
    map
  end

end





FactoryGirl.define do
  factory :restaurant do
    sequence(:name)  		{ |n| "Resto #{n}" }
    sequence(:info)  		{ |n| "Info_#{n}"}
    sequence(:lat_dec)  	{ |n| "Lat_#{n}"}
    sequence(:lng_dec)  	{ |n| "Long_#{n}"}


    #factory :admin do
    #  admin true
    #end
    
  end
end