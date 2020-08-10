class Sender
  include ActiveModel::Model

  attr_accessor :email, :receiver_email, :message, :username

  validates :email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  validates :receiver_email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
end
