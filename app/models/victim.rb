# == Schema Information
#
# Table name: victims
#
#  id                   :integer          not null, primary key
#  phone                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  premium_subscription :boolean          default(FALSE)
#  messages_received    :integer          default(0)
#

class Victim < ActiveRecord::Base
  attr_accessible :phone, :premium_subscription
  has_many :replies
  
  def toggle_subscription
    toggle(:premium_subscription)
  end
end
