class Friend
  def greeting(friend = nil)
    return "Hello, #{friend}!" if friend
    "Hello!"
  end

end
