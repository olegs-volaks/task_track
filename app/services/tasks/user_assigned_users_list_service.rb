# frozen_string_literal: true

module Tasks
  class UserAssignedUsersListService < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      assigned_users_ids = Task.user_accessible(@user.id).
        distinct.
        pluck(:assigned_to_id)

      User.where(id: assigned_users_ids)
    end
  end
end
