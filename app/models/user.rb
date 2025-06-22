class User
  include Mongoid::Document
  include Mongoid::Timestamps

  
  field :name, type: String

  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
