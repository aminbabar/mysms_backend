class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :to, type: String
  field :body, type: String
  # field :sid, type: String # Twilio message SID
  # field :status, type: String # Twilio message status (e.g., sent, delivered, failed)

  # Associations
  belongs_to :user

  # Validations 
  validates :to, presence: true
  validates :body, presence: true, length: { maximum: 250, message: "must be 250 characters or less" }

end
