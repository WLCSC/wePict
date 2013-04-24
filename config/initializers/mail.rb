ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "mail.wl.k12.in.us",
#  :domain		=> "wlcsc.k12.in.us",
  :port                 => 25,
#  :user_name            => APP_CONFIG[:email_user],
#  :password             => APP_CONFIG[:email_pass],
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}

ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
