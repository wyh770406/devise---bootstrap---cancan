require 'pp'
class User < ActiveRecord::Base
  include RailsSettings::Extend
  has_many :logs,:as=>:logable,:dependent=>:destroy
  belongs_to :session_level
  has_and_belongs_to_many :devices
	rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  attr_accessible :login
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,:mobile,:session_level_id,:birth,:device_sn

  def active?
    super and self.enable?
  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["(lower(name) = :value OR lower(email) = :value) AND lower(enable) = true", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

#  def self.find_for_authentication(conditions={})
#    unless conditions[:email] =~ /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i # email regex
#      conditions[:name] = conditions.delete("email")
#    end
#    super
#  end
#
#
#  def self.find_for_database_authentication(conditions={})
#
#    self.where("name = ?", conditions[:email]).limit(1).first #||       self.where("email = ?", conditions[:email]).limit(1).first
#
#    super
#  end

end
