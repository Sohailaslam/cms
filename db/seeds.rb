# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
DatabaseCleaner.clean_with(:truncation)

User.create!(email: "admin@test.com",password: "admin123",name: "Admin",designation: "Admin",contact_number: "28037840").add_role :admin
# User.create!(email: "manager1@test.com",password: "manager123",name: "Manager 1",designation: "Manager",contact_number: "28037840").add_role :manager
# User.create!(email: "manager2@test.com",password: "manager123",name: "Manager 2",designation: "Manager",contact_number: "28037840").add_role :manager
# User.create!(email: "associate11@test.com",password: "associate11",name: "associate11",manager_id: 2,designation: "Associate",contact_number: "28037840").add_role :associate
# User.create!(email: "associate21@test.com",password: "associate21",name: "associate21",manager_id: 2,designation: "Associate",contact_number: "28037840").add_role :associate
# User.create!(email: "associate12@test.com",password: "associate12",name: "associate12",manager_id: 3,designation: "Associate",contact_number: "28037840").add_role :associate
# User.create!(email: "associate22@test.com",password: "associate22",name: "associate22",manager_id: 3,designation: "Associate",contact_number: "28037840").add_role :associate

# Product.create!(name: "Retail Pro",description: "Inventory management | POS")
# Product.create!(name: "Point Mobile",description: "here goes the details")
# Product.create!(name: "OptCulture",description: "social media integration")
# Product.create!(name: "Syenap",description: "Camera capturing of crowd")

# Event.create!(name: "Karachi Conference", event_type: 1,location: "Karachi",no_of_days: 3)
# Event.create!(name: "Dubai Conference", event_type: 1,location: "Dubai",no_of_days: 7)

# # Visitor.create(name: "Visitor1",user_id: 1,event_id:1)
# # Visitor.create(name: "Visitor2",user_id: 1,event_id:2)

