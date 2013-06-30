class ReceiveTextController < ApplicationController
  def create
    @reply = Reply.new(body: params[:Body], from: params[:From])
    @reply.save
    if @reply
      send_text_message
    end
  end
end
