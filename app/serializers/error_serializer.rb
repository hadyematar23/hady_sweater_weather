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
end
