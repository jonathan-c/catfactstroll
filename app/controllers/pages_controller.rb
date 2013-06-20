class PagesController < ApplicationController
  def index
    @catfact = Catfact.order("RANDOM()").first
  end
  
end
