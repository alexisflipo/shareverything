class SendersController < ApplicationController
  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.valid?
      SenderMailer.send_to_sender(@sender).deliver
      SenderMailer.send_to_recipient(@sender).deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: "Message sent successfully. A confirmation has been sent on your email"
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end

  private

  def sender_params
    params.require(:sender).permit(:message, :email, :recipient, :username)
  end
end
