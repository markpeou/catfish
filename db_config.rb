require 'pg'
require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'catfishbeer'
}

ActiveRecord::Base.establish_connection(options)
