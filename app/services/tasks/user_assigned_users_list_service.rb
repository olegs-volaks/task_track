# frozen_string_literal: true

module Tasks
  class UserAssignedUsersListService < ApplicationService
    def initialize(user)
      @user = user
    end

    # This query retrieves all unique users who are either assigned a task created by the current user
    # or are the current user themselves.
    def call
      User.left_outer_joins(:assigned_tasks).
        where(tasks: { created_by_id: @user.id }).
        or(User.where(id: @user.id)).

        distinct
    end
  end
end
