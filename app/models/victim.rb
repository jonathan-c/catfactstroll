class Victim < ActiveRecord::Base
  attr_accessible :phone, :premium_subscription
  has_many :replies
  
  def toggle_subscription
    self.toggle(:premium_subscription)
  end
end
