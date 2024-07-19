# frozen_string_literal: true

module Tasks
  class Form < ModelForm
    object_class_name Task

    delegated_field :title,
                    :short_description,
                    :status,
                    :created_by_id,
                    :assigned_to_id,
                    :deadline,
                    :detail_description

    def initialize(object, current_user:)
      super(object, current_user: current_user)

      assign_default_attributes(current_user:)
    end
    def users_collection
      decorate_all(User.all).map { |user| [user.full_name, user.id] }
    end

    def statuses_collection
      self.class.object_class.statuses.keys.map do |status|
        [
          I18n.t("activerecord.enums.task.status.#{status}"),
          status
        ]
      end
    end

    private

    def assign_default_attributes(current_user:)
      self.assigned_to_id = current_user.id
      self.created_by_id = current_user.id unless self.persisted?
    end
  end
end
