class ProjectPolicy < ApplicationPolicy

  
  def index?
    true
  end

  # To ensure that private topics are only visible to signed-in users
  def show?
    record.public? || user.present?
  end

  def create?
    user.present? 
  end

  def update?
    create?
  end

  def delete?
    create?
  end


end