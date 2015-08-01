class ProjectPolicy < ApplicationPolicy

  
  def index?
    true
  end

def show?
    user.present?
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