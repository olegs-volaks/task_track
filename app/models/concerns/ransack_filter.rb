# frozen_string_literal: true

require "active_support/concern"

module RansackFilter
  extend ActiveSupport::Concern

  class_methods do
    # Override ransack ransackable_attributes method
    def searchable_attributes(*attr)
      define_singleton_method(:ransackable_attributes) do |auth_object = nil|
        attr.map(&:to_s) + _ransackers.keys
      end
    end

    # Override ransack ransackable_associations method
    def searchable_associations(*associations)
      define_singleton_method(:ransackable_associations) do |auth_object = nil|
        associations.map(&:to_s)
      end
    end
  end
end
