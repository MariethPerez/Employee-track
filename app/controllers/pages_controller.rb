class PagesController < ApplicationController
  before_action :authorize_login, only: [:secret]
  def secret
  end
end
