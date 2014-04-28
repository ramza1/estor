# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "SHIPPING RATE TYPES"
ShippingRateType::TYPES.each do |rate_type|
  ShippingRateType.find_or_create_by(name: rate_type)
end


puts "DEAL TYPES"
DealType::TYPES.each do |dt|
  DealType.find_or_create_by(name: dt)
end
