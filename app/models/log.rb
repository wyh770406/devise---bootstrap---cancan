class Log < ActiveRecord::Base
  belongs_to :logable ,:polymorphic => true
   attr_accessible :from, :cat,:level , :msg
end
