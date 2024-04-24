# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tasks::UserAssignedUsersListService do
  describe '#call' do
    it 'return users collection by current user accessible tasks' do
      current_user = create(:user)

      user1 = create(:user)
      user2 = create(:user)

      create_list(:user, 3)

      create(
        :task,
        created_by: current_user,
        assigned_to: user1,
      )

      create(
        :task,
        created_by: current_user,
        assigned_to: user2,
      )

      create_list(:task, 3)

      result = described_class.new(current_user).call

      expect(result).to contain_exactly current_user, user1, user2
    end
  end
end
