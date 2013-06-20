class Catfact < ActiveRecord::Base
  attr_accessible :message
  
  def deliver(phone)
    @account_sid = 'AC618535f2a856c7b96e55c53c9a69b867'
    @auth_token =  '17fbeecc9a6718e179cb654a77f841cf'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @account = @client.account
    @message = @account.sms.messages.create({:from => '+16314985508', :to => "+1" + phone, :body => self.message})
  end
  
  def generate_fact
    self.order("RANDOM()").first
  end
  
  def self.replies
    @account_sid = 'AC618535f2a856c7b96e55c53c9a69b867'
    @auth_token =  '17fbeecc9a6718e179cb654a77f841cf'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account
    replies = []
    @account.sms.messages.list({}).each do |message|
      replies << message.body if message.direction == "inbound"
    end
    replies
  end
end
