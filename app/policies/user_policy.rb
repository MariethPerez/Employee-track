class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    current_user.has_role?('admin')
  end

  def show?
    current_user.id == user.id || current_user.has_role?('admin')
  end

  def create?
    current_user.has_role?('admin')
  end

  def metrics_entry_exit?
    current_user.id == user.id || current_user.has_role?('admin')
  end

  # def update?
  #   current_user.id == user.id || current_user.has_role?('admin')
  # end

  # def destroy?
  #   current_user.has_role?('admin')
  # end
end