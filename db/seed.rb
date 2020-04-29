require 'pg'
require_relative '../models/defect'
require_relative '../models/engineer'


# create dummy user
#create_engineer('gj', 'gj@gj.com','password')
#engineer = find_one_engineer_by_email('gj@gj.com')


create_engineer('a', 'a@a.com','a')
engineer = find_one_engineer_by_email('a@a.com')


# create 10 dummy dish
# (1..10).each do |n|
#   create_dish(
#     "dish number #{n}", 
#     "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/carrot-cake.jpg",
#     user["id"]
#   )
# end
