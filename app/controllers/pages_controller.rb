class PagesController < ApplicationController
    # Restrict access so only logged in users can access the secret page:
  before_action :authorize_login, only: [:secret]
  def secret
  end
end
