# frozen_string_literal: true

# Monkey patch: overrider Active Storage base controller for content authentication
class ActiveStorage::BaseController < ActionController::Base
  include ActiveStorage::SetCurrent
  include BlobAuthenticatable

  protect_from_forgery with: :exception

  self.etag_with_template_digest = false

  blob_authenticatable resource: :user
end
