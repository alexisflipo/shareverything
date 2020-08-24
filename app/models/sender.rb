class Sender
  include ActiveModel::Model

  attr_accessor :email, :recipient, :message, :username, :url, :file

  validates :email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  validates :recipient, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  validates :file, presence: true, file_size: { less_than: 200.megabytes,
    message: "must not exceed 4Mo. Please choose a smaller file." }
end
