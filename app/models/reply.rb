class Reply < ActiveRecord::Base
  attr_accessible :body, :from
  
  def send_text_message
     @account_sid = 'APc52146402951b88617737ee3d4daa122'
     @auth_token = '17fbeecc9a6718e179cb654a77f841cf'
     @sandbox_number = '+16314985508'
     @from_number = '+16314985508'

     # set up a client to talk to the Twilio REST API
     @client = Twilio::REST::Client.new(@account_sid, @auth_token)

     # Uncomment when testing on the local database
     # @example = Reply.create(body: "STOP", from: "+1XXXXXXX")
   
     @request = self.body
     @send_message_to = self.from
     @account = @client.account
     if @request.downcase == "stop"
       @error_message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "Witty reply to stop."  })
        puts @error_message
     else
       @message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "Another witty reply." })
       puts @message
     end
   end
end
