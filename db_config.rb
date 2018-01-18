
require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'catfishbeer'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
