class DialingPolicy < ApplicationPolicy
  attr_reader :user, :dialing

  def initialize(user, dialing)
    @user = user
    @dialing = dialing
  end

  def index?
    user.has_role?('admin')
  end

  def show?
    @dialing.user.id == user.id || user.has_role?('admin')
  end

  def create?
    user.has_role?('admin')
  end

  def update?
    user.has_role?('admin')
  end

  def metrics_late_employees?
    user.has_role?('admin')
  end

  def metrics_overtime_employees?
    user.has_role?('admin')
  end

  # def update?
  #   current_user.id == user.id || current_user.has_role?('admin')
  # end

  # def destroy?
  #   current_user.has_role?('admin')
  # end
end