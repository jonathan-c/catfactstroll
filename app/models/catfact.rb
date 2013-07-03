# == Schema Information
#
# Table name: catfacts
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

include TwilioHelper
 
class Catfact < ActiveRecord::Base

  attr_accessible :message
  
  def deliver(phone)
    victim = Victim.find_or_create_by_phone("+1" + phone)
    TwilioApi.send_text(victim.phone, self.message)
    victim.messages_received+=1
  end
  
  def generate_fact
    self.order("RANDOM()").first
  end
  
  def self.replies
    replies = []
    TwilioApi.get_account.sms.messages.list({}).each do |message|
      replies << message.body if message.direction == "inbound"
    end
    replies
  end
end
