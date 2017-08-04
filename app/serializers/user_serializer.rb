class UserSerializer < ActiveModel::Serializer
  attributes :object_type, :id, :full_name, :avatar

  def full_name
    object.first_name + " " + object.last_name
  end

  def avatar
    object.avatar.mini_avatar_for_photo.url
  end

  def object_type
    object.class.name
  end
end
