# frozen_string_literal: true

class ApplicationForm
  def initialize(object, current_user:)
    @object = object
    @current_user = current_user
  end

  def update(_attributes)
    raise 'Not implemented'
  end

  alias create update
end
