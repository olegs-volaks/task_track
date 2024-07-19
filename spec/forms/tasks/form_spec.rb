# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tasks::Form do
  describe '#create' do
    context 'create new task' do
      it 'successfully creates new task' do
        travel_to DateTime.current

        task = Task.new
        user = create(:user)
        form = described_class.new(task, current_user: user)

        attributes = {
          title: 'title 1',
          short_description: 'description 1',
          status: 'draft',
          assigned_to_id: user.id,
          deadline: DateTime.current.next_week
        }

        result = nil

        expect { result = form.create(attributes) }.to change(Task, :count).by(1)
        expect(result).to be_truthy

        expect(Task.last).to have_attributes(
                               title: 'title 1',
                               short_description: 'description 1',
                               status: 'draft',
                               assigned_to_id: user.id,
                               created_by_id: user.id,
                               deadline: DateTime.current.next_week
                             )
      end

      it 'returns validation errors' do
        travel_to DateTime.current

        task = Task.new
        user = create(:user)
        form = described_class.new(task, current_user: user)

        attributes = {
          status: 'draft',
          assigned_to_id: user.id,
          deadline: DateTime.current.next_week
        }
        result = nil

        expect { result = form.create(attributes) }.to change(Task, :count).by(0)

        expect(result).to be_falsey

        expect(task.errors).to be_any
      end
    end
  end

  describe '#update' do
    context 'update task' do
      it 'successfully update task' do
        travel_to DateTime.current

        user_creator = create(:user)

        task = create(
          :task,
          :draft,
          title: 'title 1',
          short_description: 'description 1',
          status: 'draft',
          assigned_to: user_creator,
          created_by: user_creator,
          deadline: DateTime.current
        )

        current_user = create(:user)

        form = described_class.new(task, current_user: current_user)

        attributes = {
          title: 'title updated',
          short_description: 'description updated',
          status: 'pending',
          assigned_to_id: current_user.id,
          deadline: DateTime.current.next_week
        }

        result = form.update(attributes)

        task.reload

        expect(result).to be_truthy

        expect(task).to have_attributes(
                               title: 'title updated',
                               short_description: 'description updated',
                               status: 'pending',
                               assigned_to_id: current_user.id,
                               created_by_id: user_creator.id,
                               deadline: DateTime.current.next_week
                             )
      end

      it 'returns validation errors' do
        travel_to DateTime.current

        user_creator = create(:user)

        task = create(
          :task,
          :draft,
          title: 'title 1',
          short_description: 'description 1',
          status: 'draft',
          assigned_to: user_creator,
          created_by: user_creator,
          deadline: DateTime.current
        )

        current_user = create(:user)

        form = described_class.new(task, current_user: current_user)

        attributes = {
          title: '',
          short_description: '',
          status: 'pending',
          assigned_to_id: current_user.id,
          deadline: DateTime.current.next_week
        }

        result = form.update(attributes)

        task.reload

        expect(result).to be_falsey

        expect(Task.last).to have_attributes(
                               title: 'title 1',
                               short_description: 'description 1',
                               status: 'draft',
                               assigned_to_id: user_creator.id,
                               created_by_id: user_creator.id,
                               deadline: DateTime.current
                             )

        expect(task.errors).to be_any
      end
    end
  end
end
