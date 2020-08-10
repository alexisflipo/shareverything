class SenderMailer < ApplicationMailer

  def send_to_sender(sender)
    @sender = sender

    mail to: @sender.email,
    subject: "Sending confirmed"
  end

  def send_to_recipient(sender)
    @sender = sender
    mail to: @sender.recipient,
          subject: "Files'share"
  end

end
