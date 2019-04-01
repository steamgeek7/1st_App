ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

Padrino.before_load do
  require 'will_paginate/view_helpers/sinatra'
  require 'will_paginate/data_mapper'
end

Padrino.after_load do
  DataMapper.finalize
end
