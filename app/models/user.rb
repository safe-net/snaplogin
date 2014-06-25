class User < ActiveRecord::Base
  acts_as_authentic

  has_many :devices
  has_many :snap_logins

  def valid_password?(pw)
    self.password == pw
  end
end
