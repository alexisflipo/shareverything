class Sender
  include ActiveModel::Model

  attr_accessor :email, :recipient, :message, :username, :url

  validates :email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/, message: "nique ta mère"}
  validates :recipient, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
end
