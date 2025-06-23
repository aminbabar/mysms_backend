class MessageSerializer < ActiveModel::Serializer
  attributes :id, :to, :body, :created_at

  def id
    object.id.to_s
  end
end
