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

class Reply < ActiveRecord::Base
  attr_accessible :body, :from, :victim_id
  belongs_to :victim
  
  def send_text_message
     @account_sid = 'AC618535f2a856c7b96e55c53c9a69b867'
     @auth_token = '17fbeecc9a6718e179cb654a77f841cf'
     @sandbox_number = '+16314985508'
     @from_number = '+16314985508'

     # set up a client to talk to the Twilio REST API
     @client = Twilio::REST::Client.new(@account_sid, @auth_token)
   
     @request = self.body
     @send_message_to = self.from
     @account = @client.account
     if victim.messages_received == 9
       @message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "Congrats! Since subscribing you have learned 9 new cat facts! Did you cats have 9 lives?" })
       puts @message
     # If victim replies back with "remove".
     elsif /(remove)/i.match(@request)
       @error_message = @account.sms.messages.create({
         :from => @from_number, 
         :to => @send_message_to, 
         :body => "Great! You just subscribed to Cat Facts premium. You'll now receive a new cat fact every 30 minutes. Reply with 'remove' to unsubscribe."  
         })
        puts @error_message
        self.victim.toggle_subscription
     # If victim replies back with "fuck".
     elsif /(fuck)/i.match(@request)
       @message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "You shouldn't use language like that. Why are you so mad? Did you know cat facts are scientifically proven to help cure anger?" })
       puts @message
     # If victim replies back with "me".
     elsif /(me)/i.match(@request)
       @message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "All I hear is me me me. Why are you being so selfish? OK, fine, reply to this message with 'remove' to stop receiving cat facts." })
       puts @message
     else
       @message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "Cool story bro. I'll be sure to send you another cat fact later." })
       puts @message
     end
   end
end
