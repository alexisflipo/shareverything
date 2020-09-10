class SendersController < ApplicationController
  invisible_captcha only: [:create], honeypot: :phone_number

  def new
    @sender = Sender.new
    @document = Document.new
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.save
      @document = Document.new
      @document.file.attach(document_params[:file])
      @document.save!
      @sender.url = @document.url
      SendJob.perform_now(@sender)
      if @sender.days.present?
        SuppressJob.set(wait: (@sender.days.to_i + 1).days).perform_later(@document.id)
        redirect_root
      else
        SuppressJob.set(wait: 3.days).perform_later(@document.id)
        redirect_root
      end
    else
      flash.now[:error] = "Sorry, but your message has not been sent"
      render :new
    end
  end

  private

  def sender_params
    params.require(:sender).permit(:message, :email, :recipient, :username, :days)
  end

  def document_params
    params.require(:document).permit(:file)
  end

  def redirect_root
    redirect_to root_path, notice: "Message and file sent successfully. A confirmation has been sent on your email"
  end
end
