# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
#...
100.times {Product.create(:title => 'Artificial Intelligent', :description => 
		 %{ The learning material of Artificial Intelligent
		 	this is a magic world and all amazing things },
		 :image_url => 'sky.jpg',
		 :price => 49.50)
		}
#...