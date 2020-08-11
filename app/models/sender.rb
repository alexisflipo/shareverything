class Sender
  include ActiveModel::Model
  include ActiveModel::Validations
  attr_accessor :email, :recipient, :message, :username, :file

  validates :email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/, message: "Email can't be blank"}
  validates :recipient, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  validates :file, presence: true
end
