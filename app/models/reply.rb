# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  from       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  victim_id  :integer
#

include 'TwilioHelper'

class Reply < ActiveRecord::Base
  attr_accessible :body, :from, :victim_id
  belongs_to :victim
  
  def send_text_message
     # TwilioApi.send_text(a)
     if victim.messages_received == 9
       TwilioApi.send_text(@send_message_to, "Congrats! Since subscribing you have learned 9 new cat facts! Did you cats have 9 lives?")
     
     # If victim replies back with "remove".
     elsif /(remove)/i.match(@request)
       TwilioApi.send_text(@send_message_to, "Great! You just subscribed to Cat Facts premium. You'll now receive a new cat fact every 30 minutes. Reply with 'remove' to unsubscribe.")
       self.victim.toggle_subscription
     
     # If victim replies back with "fuck".
     elsif /(fuck)/i.match(@request)
       TwilioApi.send_text(@send_message_to, "You shouldn't use language like that. Why are you so mad? Did you know cat facts are scientifically proven to help cure anger?")
     
     # If victim replies back with "me".
     elsif /(me)/i.match(@request)
       TwilioApi.send_text(@send_message_to, "All I hear is me me me. Why are you being so selfish? OK, fine, reply to this message with 'remove' to stop receiving cat facts.")
     
     else
       TwilioApi.send_text(@send_message_to, "Cool story bro. I'll be sure to send you another cat fact later.")
     end
   end
end
