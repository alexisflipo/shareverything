class SuppressJob < ApplicationJob
  queue_as :default

  def perform(id)
    document = Document.find(id)
    document.destroy
  end
end
