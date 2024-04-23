# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskDecorator do
  describe '#t_status' do
    it 'return humanized status' do
      task = build(:task, :pending)

      decorated_task = described_class.new(task)

      expect(decorated_task.t_status).to eq 'Pending'
    end
  end

  describe '#created_by_full_name' do
    it 'Creator user full name' do
      task = build(
        :task,
        created_by: build(
          :user,
          first_name: 'Jonn',
          last_name: 'Snow'
        )
      )

      decorated_task = described_class.new(task)

      expect(decorated_task.created_by_full_name).to eq 'Jonn Snow'
    end
  end

  describe '#assigned_to_full_name' do
    it 'Creator user full name' do
      task = build(
        :task,
        assigned_to: build(
          :user,
          first_name: 'Jonn',
          last_name: 'Snow'
        )
      )

      decorated_task = described_class.new(task)

      expect(decorated_task.assigned_to_full_name).to eq 'Jonn Snow'
    end
  end

  describe '#l_deadline' do
    it 'Creator user full name' do
      task = build(
        :task,
        deadline: Time.zone.local(2024, 4, 24, 12, 0, 0)
      )

      decorated_task = described_class.new(task)

      expect(decorated_task.l_deadline).to eq 'April 24, 2024 12:00'
    end
  end
end
