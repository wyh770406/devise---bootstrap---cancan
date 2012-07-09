class CallnoPool < ActiveRecord::Base
   attr_accessible :name,:desc,:start_callno,:end_callno,:is_default

    validates_numericality_of :start_callno,only_integer:true
    validates_numericality_of :end_callno,only_integer:true
end
