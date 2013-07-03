module TwilioHelper
  class TwilioApi
    @account_sid = 'AC618535f2a856c7b96e55c53c9a69b867'
    @auth_token =  '17fbeecc9a6718e179cb654a77f841cf'

    # set up a client to talk to the Twilio REST API
    
    def self.get_account
      client = Twilio::REST::Client.new(@account_sid, @auth_token)
      client.account
    end
    
    def self.send_text(to, message)
      message = get_account.sms.messages.create({:from => '+16314985508', :to => to, :body => message})
      puts message 
    end
  end
  
end