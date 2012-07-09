# encoding: utf-8
class SessionLevel < ActiveRecord::Base
   attr_accessible :slevel_code, :slevel_name, :slevel_desc
   has_many :users
end
