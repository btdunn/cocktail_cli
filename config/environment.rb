require 'bundler/setup'
Bundler.require

require 'tty-prompt'

require_all 'lib'
ActiveRecord::Base.logger = nil
