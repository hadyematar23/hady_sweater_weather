class ErrorSerializer

  def initialize

  end

  def serialize_user_error(error_messages)
    {
      data: {
        type: "errors",
        id: nil,
        attributes: {
          error_messages: error_messages,
        }
      }
    }
  end

  def serialize_login_error
    {
      data: {
        type: "errors",
        id: nil,
        attributes: {
          error_messages: "That username or that password, or the combination, could not be found in the system.",
        }
      }
    }
  end
end
