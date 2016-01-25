# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Food.create!(title: 'Crusted Fish with Chillies',
	description: %{<p>Pan seared fish topped with bread crumbs, glazed in chilli sauce, served
		with sauteed vegetables, gratin potatoes and french fries</p>}, image_url: 'crusted_fish.jpg',
		price: 8.45)