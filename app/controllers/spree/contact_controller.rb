module Spree
	class ContactController < BaseController
	  before_filter :load_topics

	  def new
	    @message = Message.new
	  end
	  
	  def show
    end

	  def create
	    @message = Message.new(params[:message] || {})
	    if @message.save
	      ContactMailer.message_email(@message).deliver
	      redirect_to contact_path
	    else
	      render :action => 'show'
	    end
	  end

	private
	  def load_topics
	    @topics = ContactTopic.all
	  end
	end	
end