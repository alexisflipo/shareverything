class SendersController < ApplicationController
  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(sender_params)
  end

  private

  def sender_params
    params.require(:sender).permit(:message, :email, :recipient, :username)
  end
end
