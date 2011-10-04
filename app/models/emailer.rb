class Emailer < ActionMailer::Base
  def contact_email(email_params)
    # You only need to customize @recipients.
    #@recipients = "chris@nomoreart.co.uk"
    @recipients = "info@bruxellesdublin.com"
    @from = email_params[:name] + " <" + email_params[:emailaddress] + ">"
    @subject = "Contact Form from Bruxellesdublin.com"
    @sent_on = Time.now
    @body["email_name"] = email_params[:name]
    @body["email_body"] = email_params[:comments] + "<br /><br />" + email_params[:wherefound]
    content_type "text/html"
  end
end