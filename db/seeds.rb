# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(:username => "admin", :email => 'admin@zoeoberon.com', :role => 'admin', :password => '123123', :password_confirmation => '123123')
User.create(:username => "molly", :email => 'molly@zoeoberon.com', :role => 'manager', :password => '123123', :password_confirmation => '123123')
User.create(:username => "fred", :email => 'fred@zoeoberon.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.create(:username => "guest", :email => 'guest@zoeoberon.com', :role => 'guest', :password => '123123', :password_confirmation => '123123')
User.create(:username => "felix", :email => 'felix@zoeoberon.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.create(:username => "suzy", :email => 'suzy@zoeoberon.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.create(:username => "jane", :email => 'jane@zoeoberon.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
User.create(:username => "darcy", :email => 'darcy@zoeoberon.com', :role => 'user', :password => '123123', :password_confirmation => '123123')
