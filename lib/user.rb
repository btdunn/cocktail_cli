class User < ActiveRecord::Base
  has_many :favorites
  has_many :cocktails, through: :favorites

  def self.get_user_names
    all.pluck(:username)
  end
  
  def self.get_user_id(name)
    User.find_by(username: name).id
  end


end  