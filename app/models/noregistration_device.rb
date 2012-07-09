class NoregistrationDevice < ActiveRecord::Base
   attr_accessible :name, :sn_no, :ip_address, :mac_address,:registration_status
end
