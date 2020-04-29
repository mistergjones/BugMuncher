# load our model data access methods
# and then pause with a repl
# great for testing data access in development

require 'pg'
require 'pry'

require_relative 'models/defect'
require_relative 'models/engineer'

binding.pry