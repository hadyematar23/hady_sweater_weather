class UserSerializer
  def initialize(user)
    @user = user 
  end

  def serialize_user
    {
      data: {
        type: "users",
        id: @user.id,
        attributes: {
          email: @user.email,
          api_key: @user.api_key
        }
      }
    }
  end
end
