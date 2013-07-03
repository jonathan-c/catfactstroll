module TwilioHelper
  class TwilioApi
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token =  ENV["TWILIO_AUTH_TOKEN"]

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