module Helpers

 def sign_in_as(user)
  request.session[:user_id]=user.id
 end

end