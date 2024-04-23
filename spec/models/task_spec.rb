require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'scope' do
    context '#user_accessible' do
      it 'return user accessible tasks' do
        user1 = create(:user)
        user2 = create(:user)

        task1 = create(:task, created_by: user1, assigned_to: user1)
        task2 = create(:task, created_by: user1, assigned_to: user2)
        task3 = create(:task, created_by: user2, assigned_to: user1)

        create(:task, created_by: user2, assigned_to: user2)
        create(:task)

        tasks = described_class.user_accessible(user1.id)

        expect(tasks).to contain_exactly task1, task2, task3
      end
    end
  end
end
