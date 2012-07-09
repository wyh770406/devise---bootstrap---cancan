# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#puts 'SETTING UP DEFAULT USER LOGIN'
#user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.name
#user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user2.name
#user.add_role :admin

puts '添加会话等级代码'
SessionLevel.create! :slevel_code=>"001",:slevel_name=>"管理员用户",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"002",:slevel_name=>"消防音乐",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"003",:slevel_name=>"消防寻呼",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"004",:slevel_name=>"本地寻呼",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"005",:slevel_name=>"本地音乐",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"006",:slevel_name=>"远程寻呼",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"007",:slevel_name=>"远程音乐",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"008",:slevel_name=>"普通对讲",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"009",:slevel_name=>"紧急求助",:slevel_desc=>"init session level"
SessionLevel.create! :slevel_code=>"010",:slevel_name=>"普通用户",:slevel_desc=>"init session level"
puts '添加初始等级代码结束'


puts '添加未被注册设备'
#NoregistrationDevice.create! :name=>"未被注册设备名称1",:sn_no=>"sn/001",:ip_address=>"192.168.0.11",:mac_address=>"sadsafdsa82001"
#NoregistrationDevice.create! :name=>"未被注册设备名称2",:sn_no=>"sn/002",:ip_address=>"192.168.0.12",:mac_address=>"sadsafdsa82002"
#NoregistrationDevice.create! :name=>"未被注册设备名称3",:sn_no=>"sn/003",:ip_address=>"192.168.0.13",:mac_address=>"sadsafdsa82003"
#NoregistrationDevice.create! :name=>"未被注册设备名称4",:sn_no=>"sn/004",:ip_address=>"192.168.0.14",:mac_address=>"sadsafdsa82004"
puts '添加未被注册设备结束'

