class PagesController < ApplicationController
  def home
    @sender = Sender.new
  end
end
