class DocumentsController < ApplicationController

  def show
    @document = set_document
  end

  def download
    @document = set_document
        send_data(@document.file_contents,
            type: @document.content_type,
            filename: @document.filename)
  end

  private

  def set_document
    Document.find_by url: params[:url]
  end
end

