class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :to, type: String
  field :body, type: String
  # field :sid, type: String
  # field :status, type: String
  

  # Associations
  belongs_to :user

  # Validations 
  validates :to, presence: true
  validates :body, presence: true, length: { maximum: 250, message: "must be 250 characters or less" }
  validate :to_must_be_valid_phone

  def to_must_be_valid_phone
    phone = Phonelib.parse(to)
    unless phone.valid? && phone.e164.present?
      errors.add(:to, 'is not a valid phone number')
    end
  end

  index({ user_id: 1, created_at: -1 })

end
