# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Deal.create(name: 'Hillstone Restaurant', description: 'B1G1F on all sushi rolls over $15', code: 'HILLSTONE', fine: "12p-8p Mondays only", latitude: 34.017553, longitude: -118.499853)

Deal.create(name: 'Huntley Hotel', description: 'B1G1F on all cocktails at the bar on the 32nd floor', code: 'HUNTLEY', fine: "6p-8p weeknights only", latitude: 34.018816, longitude: -118.501038)

Deal.create(name: 'Panera Bread', description: 'B1G1F on all full-size sandwiches', code: 'PANERA', fine: "12p-3p weekdays only", latitude: 34.017553, longitude: -118.499853)

