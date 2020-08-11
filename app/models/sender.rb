class Sender
  include ActiveModel::Model

  attr_accessor :email, :recipient, :message, :username, :file

  validates :email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  validates :recipient, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
end
