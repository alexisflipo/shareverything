class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
  end

  def download
    @document = Document.find(params[:id])
    send_data(@document.file_contents,
            type: @document.content_type,
            filename: @document.filename)
  end
end
