class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :created_tasks, class_name: 'Task', foreign_key: 'created_by_id'
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assigned_to_id'

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Ransack search attributes filter, see RansackFilter
  searchable_attributes(:first_name, :last_name)
  searchable_associations :assigned_tasks, :created_tasks

  ransacker :full_name, formatter: proc { |v| v.mb_chars.downcase.to_s } do |parent|
    Arel::Nodes::NamedFunction.new(
      'LOWER',
      [
        Arel::Nodes::NamedFunction.new(
          'concat_ws',
          [
            Arel::Nodes::SqlLiteral.new("' '"),
            parent.table[:first_name], parent.table[:last_name]
          ]
        )
      ]
    )
  end

end
