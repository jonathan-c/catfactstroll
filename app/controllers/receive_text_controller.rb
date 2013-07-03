class ReceiveTextController < ApplicationController
  def create
    # params[:From] = "+15166582879"
    # from = params[:From]
    @reply = Victim.find_by_phone(params[:From]).replies.new(body: params[:Body], from: params[:From])
    @reply.save
    if @reply
      @reply.send_text_message
    end
  end
end



