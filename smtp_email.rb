require 'yaml'
require 'net/smtp'

config = YAML.load_file('config.yml')
gmail_username = config['gmail_username']
gmail_password = config['gmail_password']

# Define the email message
message = <<MESSAGE_END
From:  <#{gmail_username}>
To: <storageshishir@gmail.com>
Subject: SMTP e-mail test

This is a test e-mail message sent using Gmail's SMTP server.
MESSAGE_END


# Sending the email
Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', gmail_username, gmail_password, :plain) do |smtp|
  smtp.send_message message, gmail_username, 'storageshishir@gmail.com'
end
