# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application22.js, application.scss, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( jquery.js jquery.counterup.min.js )
Rails.application.config.assets.precompile += %w( dashboard.css dripicon.css foundation.css pace-theme-flash.css
                                                  palette.css slicknav.css style.css theme.css themify-icons.css
                                                  typicons.css login.css
                                                  pace.js modernizr.js jquery.js waypoints.min.js preloader-script.js
                                                  foundation.js jquery.slimscroll.js jquery.slicknav.js sliding-menu.js
                                                  jquery.counterup.min.js jquery.circliful.js app.js loader.js
                                                  jquery.flot.js jquery.flot.resize.min.js jquery.flot.pie.min.js)