require 'database_cleaner'
require 'database_cleaner/cucumber'

DatabaseCleaner.orm = 'mongo_mapper'

Before { DatabaseCleaner.clean }
