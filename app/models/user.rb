
class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  after_create :not_admin 



  def mood 
    if self.nausea && self.happiness 
       self.nausea > self.happiness ? 'sad' : 'happy'
    else
      'meh'
    end
  end

  def not_admin
    self.admin = false
  end

end