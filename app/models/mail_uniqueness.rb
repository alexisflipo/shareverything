class MailUniqueness < ActiveModel::Validator
  def validate(record)
    unless record.email != record.recipient
    record.errors[:recipient] << 'and Sender must be different'
    end
  end
end
