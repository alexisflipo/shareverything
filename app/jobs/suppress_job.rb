class SuppressJob < ApplicationJob
  queue_as :default

  def perform(id)
    puts "Starting destroying"
    document = Document.find(id)
    document.destroy
    puts "Finish destroying"
  end
end
