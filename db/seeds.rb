# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
DatabaseCleaner.clean_with(:truncation)

User.create(email: "manager@test.com",password: "manager",name: "manager").add_role :manager
User.create(email: "associate1@test.com",password: "associate1",name: "associate1",manager_id: 1).add_role :associate
User.create(email: "associate2@test.com",password: "associate2",name: "associate2",manager_id: 1).add_role :associate

Product.create(name: "Retail Pro",description: "Inventory management | POS")
Product.create(name: "Point Mobile",description: "here goes the details")
Product.create(name: "OptCulture",description: "social media integration")
Product.create(name: "Syenap",description: "Camera capturing of crowd")

Event.create(name: "Karachi Conference", event_type: 1,user_id:1)
Event.create(name: "Dubai Conference", event_type: 1,user_id:1)

Visitor.create(name: "Visitor1",user_id: 1,event_id:1)
Visitor.create(name: "Visitor2",user_id: 1,event_id:2)

