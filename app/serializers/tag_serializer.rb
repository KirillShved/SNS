class TagSerializer < ActiveModel::Serializer
  attributes :object_type, :text
  def object_type
    object.class.name
  end
end
