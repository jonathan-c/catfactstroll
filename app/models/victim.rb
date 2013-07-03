class Victim < ActiveRecord::Base
  attr_accessible :number, :premium_subscription
  has_many :replies
  
  def toggle_subscription
    self.toggle(:premium_subscription)
  end
end
