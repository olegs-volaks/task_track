class Task < ApplicationRecord
  enum :status, {
    draft: 'draft',
    pending: 'pending',
    in_progress: 'in_progress',
    completed: 'completed'
  }, prefix: true, validate: true, default: :draft

  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :assigned_to, class_name: 'User', foreign_key: 'assigned_to_id'

  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  scope :user_accessible, ->(user_id) {
    where(
      arel_table[:created_by_id].eq(user_id).or(
        arel_table[:assigned_to_id].eq(user_id)
      )
    )
  }

  # Ransack search attributes filter, see RansackFilter
  searchable_attributes(:title, :description, :status, :created_by_id, :assigned_to_id, :deadline, :created_at, :updated_at)
  searchable_associations(:created_by, :assigned_to)
end
