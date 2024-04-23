# frozen_string_literal: true

module DecorateHelper
  def decorate(object, decorator: nil)
    class_name = decorator || "#{object.class.name}Decorator"

    class_name.constantize.new(object)
  end

  def decorate_all(objects, decorator: nil)
    objects.map do |object|
      decorate(object, decorator: decorator)
    end
  end
end
