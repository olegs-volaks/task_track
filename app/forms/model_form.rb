# frozen_string_literal: true

class ModelForm < ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Validations
  include DecorateHelper

  attr_reader :object

  # Need for simple form
  delegate :persisted?, :model_name, :id, to: :object

  class << self
    def object_class
      const_name = :OBJECT_CLASS

      if const_defined?(const_name)
        const_get(const_name)
      else
        raise "#object_class_name not defined for #{self.name} class"
      end
    end

    # Need for simple form 'required: true' detection
    def validators_on(*attributes)
      super(*attributes) + object_class.validators_on(*attributes)
    end

    # Need for simple form 'f.association'
    def reflect_on_association(association)
      if object_class.respond_to?(:reflect_on_association)
        object_class.reflect_on_association(association)
      end
    end

    # Need to  attributes humanize with using object localization
    def human_attribute_name(attribute, options = {})
      if virtual_fields.include?(attribute.to_sym)
        human_attribute_name(attribute, options)
      else
        object_class.human_attribute_name(attribute, options)
      end
    end

    protected

    def object_class_name(class_name)
      class_name = class_name.constantize unless class_name.is_a?(Class)

      const_set(:OBJECT_CLASS, class_name)
    end

    def delegated_field(*attr_name)
      attr_name.each do |attr|
        delegated_fields << attr.to_sym

        delegate attr, to: :object
        delegate "#{attr}=", to: :object
      end
    end

    def virtual_field(*attr_name)
      attr_name.each do |attr|
        virtual_fields << attr.to_sym

        attr_accessor attr
      end
    end

    private

    def delegated_fields
      @delegated_fields ||= []
    end

    def virtual_fields
      @virtual_fields ||= []
    end
  end

  def initialize(object, current_user:)
    @object = object
    @current_user = current_user
  end

  def update(attributes)
    object.with_transaction_returning_status do
      assign_attributes(attributes)
      save
    end
  end

  alias create update

  private

  def save(raise_on_save_failure = false)
    if valid_object_and_form?
      object.save

      true
    else
      raise ActiveRecord::RecordInvalid, object if raise_on_save_failure

      false
    end
  end

  def save!
    save(true)
  end

  def valid_object_and_form?
    return true if valid? && object.valid?

    errors.merge!(object.errors)

    false
  end
end
