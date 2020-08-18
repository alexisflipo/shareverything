class Document < ApplicationRecord
  require 'securerandom'
  extend FriendlyId
  friendly_id :url, use: :slugged
  has_one_attached :file


  def generate_url
    self.url = loop do
      random_token = SecureRandom.urlsafe_base64(32, false)
      break random_token unless Document.exists?(url: random_token)
    end
  end

  def normalize_friendly_id(value)
    value.to_s.parameterize(preserve_case: true)
  end

end
#   def initialize(params = {})
#   file = params.delete(:file)
#   super
#   if file
#     self.filename = sanitize_filename(file.original_filename)
#     self.content_type = file.content_type
#     self.file_contents = file.read
#   end
# end
# private
#   def sanitize_filename(filename)
#     # Get only the filename, not the whole path (for IE)
#     # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
#     return File.basename(filename)
#   end

