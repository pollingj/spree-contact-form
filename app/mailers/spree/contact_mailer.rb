module Spree
	class ContactMailer < ActionMailer::Base
	  helper "spree/base"

	  def message_email(message)
	    subject = "#{Spree::Config[:site_name]} - Message from #{message.email}"

	    @message = message
	    mail(:to => message.topic.emails, :from => "website@landrovertuning.com", :subject => subject, :reply_to => message.email) 
	  end
	end	
end