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

puts "Return Reasons"
ReturnReason::REASONS.each do |value|
  rr = ReturnReason.find_by_label(value)
  unless rr
    ReturnReason.create(:label => value, :description => value )
  end
end

puts "Return CONDITIONS"
ReturnCondition::CONDITIONS.each do |value|
  rc = ReturnCondition.find_by_label(value)
  unless rc
    ReturnCondition.create(:label => value, :description => value )
  end
end

puts "PHONE TYPES"
PhoneType::NAMES.each do |phone_type|
  PhoneType.find_or_create_by(name: phone_type)
end