class SendersController < ApplicationController
  def new
    @sender = Sender.new
    @document = Document.new
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.valid?

      # @document.file.attach(params[:file])
      @document = Document.new
      @document.file.attach(params[:sender][:file])
      @document.save!
      @sender.url = @document.url
      SenderMailer.send_to_sender(@sender).deliver
      SenderMailer.send_to_recipient(@sender).deliver
      SuppressJob.set(wait_until: 2.days.from_now).perform_later(@document.id)
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

  # def document_params
  #   params.require(:sender).permit(:file)
  # end
end
