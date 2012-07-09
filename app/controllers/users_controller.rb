class UsersController < ApplicationController
  #before_filter :authenticate_admin!
  #layout "admin"
  skip_before_filter :verify_authenticity_token,:only=>:change_encrypted_password

  def verify_encrypted_password
    @user = User.where(:email=>params[:email]).first

    if @user
      bcrypt = ::BCrypt::Password.new(@user.encrypted_password)
      password2 = ::BCrypt::Engine.hash_secret("#{params[:encrypted_password]}", bcrypt.salt)

      if bcrypt === password2
        render :text=>"ok"
      else
        render :text=>"no"
      end

    else
      render :text=>"no"

    end

  end

  def change_encrypted_password

    @user = User.where(:email=>params[:email]).first
    @user.encrypted_password = params[:encrypted_password]
    if @user.save!
      render :text=>"ok"
    else
      render :text=>"no"
    end

  end

end
