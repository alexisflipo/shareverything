class SendersController < ApplicationController
  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(sender_params)
    response = Cloudinary::Uploader.upload(@sender.file.path)
    link = Link.new(random_code: response["public_id"])
    if @sender.valid? && response["public_id"].present? && link.save!
      SenderMailer.send_to_sender(@sender).deliver
      SenderMailer.send_to_recipient(@sender).deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: "Message and file sent successfully. A confirmation has been sent on your email"
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end

  private

  def sender_params
    params.require(:sender).permit(:message, :email, :recipient, :username, :file)
  end
end
