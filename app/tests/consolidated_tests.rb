require 'simplecov'

SimpleCov.start do
  add_group 'Tests', 'app/tests'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Repositories', 'app/repositories'
  add_group 'Utils', 'app/utils'
  add_group 'Entry Point', 'app/main'
end

require_relative 'repository_test'
require_relative 'book_test'
require_relative 'controller_test'
