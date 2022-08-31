require 'twilio-ruby'

class SmsService

  attr_reader :client

  @@account_sid = ENV['TWILIO_ACCOUNT_SID'] 

  @@auth_token = ENV['TWILIO_AUTH_TOKEN'] 

  @@phone_number = ENV['TWILIO_PHONE_NUMBER'] 

  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

  @@message = 'Você foi cadastrado como Municipe'

  def send_sms(resident)
    @@client.messages.create(
    from: @@phone_number,
    to: resident.phone,
    body: @@message
    )
  end

end