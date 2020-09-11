class Sender < ApplicationRecord
  include ActiveModel::Validations

  has_one :document
  has_one_attached :file

  validates :email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  validates :recipient, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  # validates :file, presence: true, file_size: { less_than: 200.megabytes,
    # message: "must not exceed 200Mo. Please choose a smaller file." }
  validates_with MailUniqueness
end
