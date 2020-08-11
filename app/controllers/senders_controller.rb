class SendersController < ApplicationController
  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.valid?

      document = Document.new(filename: params[:sender][:file].original_filename, content_type: params[:sender][:file].content_type, file_contents: params[:sender][:file].read)
      document.save!
      document.update(url:"http://localhost:3000/documents/#{document.to_param}")
      @sender.url = document.url
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
