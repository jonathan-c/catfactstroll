class PagesController < ApplicationController
  def index
    @catfact = Catfact.order("RANDOM()").first
    @replies = Catfact.replies
  end
  
end
