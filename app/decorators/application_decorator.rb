# frozen_string_literal: true

class ApplicationDecorator < SimpleDelegator
  include DecorateHelper

  alias object __getobj__

  private

  def t_context(key, **options, &block)
    raise 'Key must by start with .' unless key.start_with?('.')

    path = "decorators.#{self.class.to_s.underscore.sub('_decorator', '')}#{key}"

    I18n.t(path, **options, &block)
  end
end
