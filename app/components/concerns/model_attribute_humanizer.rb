# frozen_string_literal: true

require "active_support/concern"
module ModelAttributeHumanizer
  extend ActiveSupport::Concern

  class_methods do

    # Define instance methods for model attributes (exclude id attribute) humanize
    # @param [String, Symbol, NilClass] prefix - methods prefix, default - model name. May be nil, then will be without a prefix
    def define_humanize_methods_for(model_class, prefix: (no_prefix = true), private_methods: true)
      prefix = if no_prefix
                 model_class.to_s.underscore.split('/').last
               else
                 prefix.to_s.downcase
               end

      Task.attribute_names[1..].each do |attr_name|
        attr_name = attr_name.delete_suffix('_id')

        method_name = ['t', prefix, attr_name].compact.join('_')
        define_method(method_name) do
          Task.human_attribute_name(attr_name.to_sym)
        end

        private(method_name.to_sym) if private_methods
      end

      method_name = [prefix, 'human_attribute_name'].compact.join('_')
      define_method(method_name) do |attr_name|
        Task.human_attribute_name(attr_name)
      end

      private(method_name.to_sym) if private_methods
    end
  end
end
