class TagSerializer < ActiveModel::Serializer
  attributes :object_type, :text, :id

  def object_type
    object.class.name
  end
end
