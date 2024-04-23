# frozen_string_literal: true

class ApplicationService
  include DecorateHelper

  private

  def t_context(key, **options, &block)
    raise 'Key must by start with .' unless key.start_with?('.')

    path = "services.#{self.class.to_s.underscore.sub('_decorator', '')}#{key}"

    I18n.t(path, **options, &block)
  end
end
