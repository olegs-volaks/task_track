# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap-icons/font")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.action_cable.precompile_assets = false
Rails.application.config.active_storage.precompile_assets = false


Rails.application.config.after_initialize do |app|
  app.config.assets.precompile -= Stimulus::Engine::PRECOMPILE_ASSETS
  app.config.assets.precompile -= Turbo::Engine::PRECOMPILE_ASSETS
  app.config.assets.precompile -= %w( actiontext.js actiontext.esm.js trix.js trix.css )
end
