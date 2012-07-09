class Device < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates_presence_of :name,:sn_no,:callno
  validates_uniqueness_of :name,:sn_no,:callno

  attr_accessible :sn_no, :name, :callno, :desc,:user_id

#  belongs_to :user
end
