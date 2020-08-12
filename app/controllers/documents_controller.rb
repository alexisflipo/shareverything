class DocumentsController < ApplicationController
  def show
    @document = Document.friendly.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    send_data(@document.file_contents,
            type: @document.content_type,
            filename: @document.filename)
  end
end
