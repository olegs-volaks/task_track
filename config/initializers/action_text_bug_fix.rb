# frozen_string_literal: true
#
# ActionText bug: trix editor does not display previously uploaded attachments (edit form with already saved attachments)
# Issue with fix: https://github.com/rails/rails/issues/52233
# TODO: Remove this once the fix is available in the stable version
require "action_text/content"
module ActionText
  class Content
    def render_attachments(**options, &block)
      content = fragment.replace(ActionText::Attachment.tag_name) do |node|
        if node.key?("content") && node["content"].present?
          node["content"] = sanitize_content_attachment(node["content"])
        elsif node.key?("content")
          node.remove_attribute("content")
        end
        block.call(attachment_for_node(node, **options))
      end
      self.class.new(content, canonicalize: false)
    end
  end
end

# Monkey patch for pdf image preview in trix editor
# https://github.com/rails/rails/issues/38027
# https://github.com/rails/rails/pull/39113
# TODO: Remove this once the fix is available in the stable version
require "active_support/core_ext/object/try"
module ActionText
  module Attachments
    module TrixConversion
      def to_trix_attachment(content = trix_attachment_content)
        attributes = full_attributes.dup
        attributes["content"] = content if content
        attributes["url"] = trix_attachable_url if previewable_attachable? && previewable?
        TrixAttachment.from_attributes(attributes)
      end

      def trix_attachable_url
        Rails.application.routes.url_helpers.rails_blob_url(preview_image.blob, only_path: true)
      end
    end
  end
end

