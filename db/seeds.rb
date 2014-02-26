# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.find_or_create_by_username(:username => "admin", :email => 'admin@zoeoboeron.com', :role => 'admin', :password => '123123', :password_confirmation => '123123')
User.find_or_create_by_username(:username => "molly", :email => 'molly@zoeoboeron.com', :role => 'manager', :password => '123123', :password_confirmation => '123123')
User.find_or_create_by_username(:username => "fred", :email => 'fred@zoeoboeron.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.find_or_create_by_username(:username => "guest", :email => 'guest@zoeoboeron.com', :role => 'guest', :password => '123123', :password_confirmation => '123123')
User.find_or_create_by_username(:username => "felix", :email => 'felix@zoeoboeron.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.find_or_create_by_username(:username => "suzy", :email => 'suzy@zoeoboeron.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.find_or_create_by_username(:username => "jane", :email => 'jane@zoeoboeron.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.find_or_create_by_username(:username => "darcy", :email => 'darcy@zoeoboeron.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
