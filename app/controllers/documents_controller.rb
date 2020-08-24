class DocumentsController < ApplicationController

  def show
    @document = set_document
  end

  private

  def set_document
    Document.find_by url: params[:url]
  end
end

