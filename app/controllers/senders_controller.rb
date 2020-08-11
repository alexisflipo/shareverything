class SendersController < ApplicationController
  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.valid?
      response = Cloudinary::Uploader.upload(@sender.file.path)
      link = Link.new(random_code: response["public_id"])
      link.save!
      SenderMailer.send_to_sender(@sender).deliver
      SenderMailer.send_to_recipient(@sender).deliver
      redirect_to root_path, notice: "Message and file sent successfully. A confirmation has been sent on your email"
    else
      flash.now[:error] = "Sorry, but your message has not been sent"
      render :new
    end
  end

  private

  def sender_params
    params.require(:sender).permit(:message, :email, :recipient, :username, :file)
  end
end
