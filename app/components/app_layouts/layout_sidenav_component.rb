# frozen_string_literal: true

module AppLayouts
  class LayoutSidenavComponent < ApplicationComponent
    renders_one :sidebar, AppLayouts::SidebarComponent

    def initialize(current_user:)
      @current_user = current_user
    end

    private

    def decorated_current_user
      @decorated_current_user ||= decorate(@current_user)
    end

    def user_full_name
      decorated_current_user.full_name
    end

    def footer_text
      t('.footer', year: DateTime.current.year)
    end
  end
end
