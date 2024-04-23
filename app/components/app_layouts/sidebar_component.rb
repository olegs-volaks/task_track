# frozen_string_literal: true

module AppLayouts
  class SidebarComponent < ApplicationComponent
    def initialize(current_user:, current_path:)
      @current_user = current_user
      @current_path = current_path
    end

    private

    def nav_links
      [
        AppLayouts::NavLinkComponent.new(
          title: t('.links.dashboard'),
          icon: 'gauge-high',
          link: root_path,
          active: active_link?(%r{\A\/(\?.*)?\Z})
          ),
        AppLayouts::NavLinkComponent.new(
          title: t('.links.tasks'),
          icon: 'list-check',
          link: tasks_path,
          active: active_link?(%r{\A\/tasks})
          )
      ]
    end

    def decorated_current_user
      @decorated_current_user ||= decorate(@current_user)
    end

    def user_full_name
      decorated_current_user.full_name
    end

    def active_link?(regex)
      @current_path =~(regex)
    end
  end
end
