# ruby_projects
Ruby Projects for practice

# Interactive Ruby
### irb -v

# Build gem command
gem build studio_game.gemspec

# Install gem
gem install studio_game_sb-2.0.0.gem

# List all gems
gem list studio_game_sb -d

# Uninstall gem
gem uninstall studio_game_sb

# Put gems on rubygems.org
gem push studio_game_sb-2.0.0.gem

# Install gem from rubygems server
gem search studio_game_sb -ed (Exact match)
gem install studio_game_sb

# reference flinks once install as provided in load path 
ex. require "studio_game_sb/game"
or require "studio_game_sb" with new fix

Notice that when using a gem, you need to use require rather than require_relative. When you install a gem, its lib directory is automatically added to the list of directories where Ruby looks for files. (This list is stored in the variable $LOAD_PATH.) So when you require a file from the gem, Ruby will find it in the gem's lib directory