lock "~> 3.14.1"

set :rbenv_type, :user
set :rbenv_ruby, "2.7.1"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value