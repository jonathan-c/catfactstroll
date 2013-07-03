class CatfactsController < ApplicationController
  def create
    # if check_if_fact_exists(params[:message]).nil?
    #   @catfact = Catfact.find_by_message(params[:message])
    # else
    #   @catfact = Catfact.new(message: params[:message])
    #   @catfact.save
    # end
    @catfact = Catfact.find_or_create_by_message(params[:message])
    @catfact.deliver(params[:to])
    redirect_to root_path, :notify => "Sent!"
  end
  
  private
    
    def check_if_fact_exists(fact)
      Catfact.where(message: fact)
    end
end
