require 'bundler/setup'
Bundler.require

require 'tty-prompt'

require_all 'lib'

# ActiveRecord::Base.establish_connection(
#   adapter: 'sqlite3',
#   data: 'drink_hash.rb')

ActiveRecord::Base.logger = nil


