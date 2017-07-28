class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      # if user.role == 'admin'
      #   can [:manage], :all
      # end

      can [:update, :create_nested_resource, :read_notifications], User, id: user.id

      can [:create, :update, :destroy], Album, user_id: user.id

      can [:create, :update, :destroy], Photo, album: { user_id: user.id }

      can [:create, :destroy], Comment, user_id: user.id
      can [:destroy], Comment, photo: { album: { user_id: user.id }}

      can [:create, :destroy], Relationship, follower_id: user.id
      cannot [:create], Relationship, { followed_id: user.id, follower_id: user.id }
    end

    can [:read], User
    can [:read], Album
    can [:read], Photo
    can [:read], Relationship
    can [:read], Comment
  end
end
