class User < ActiveRecord::Base
  has_many :favorites
  has_many :cocktails, through: :favorites


  def self.create_user
    puts "Enter Island Username"
    username = gets.strip
    User.create(username: username)
    # system "clear"
  end

  def self.get_user_names
    all.pluck(:username)
  end
  
  def self.get_user_id(name)
    User.find_by(username: name).id
  end


end  