class SendJob < ApplicationJob
  queue_as :default

  def perform(sender)
    SenderMailer.send_to_sender(sender).deliver
    SenderMailer.send_to_recipient(sender).deliver
  end
end
