module ReceiveTextHelper
  
  def send_text_message
     @account_sid = 'AC618535f2a856c7b96e55c53c9a69b867'
     @auth_token = '17fbeecc9a6718e179cb654a77f841cf'
     @sandbox_number = '+16314985508'
     @from_number = '+16314985508'

     # set up a client to talk to the Twilio REST API
     @client = Twilio::REST::Client.new(@account_sid, @auth_token)

     # Uncomment when testing on the local database
     # @example = Reply.create(body: "STOP", from: "+1XXXXXXX")
   
     @request = Reply.last.body
     @send_message_to = Reply.last.from
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
