# Library System with Ruby
#### In this project, I look for study ruby language, creating a simple libary system.
- || operator can validate if some value comes ```nil``` to return a default value
## MVC -> Model, View, Controller
## TDD -> Test Driven Development
##### In this project, I used minitest from ruby to make the unit tests.
##### Script to run the test file
    ruby -I. ./test/test_file_name.rb
- -I param specify a path to include aditional directories in the charge (This is usefull to ruby to find test file's dependencies around the code)
##### Minitest notes...
    class TestSomething < Minitest::Test
      # This will define the actual class as a minitest test class, here is possible to write the unit tests
    end
---
    def setup
      # the code inside this function will run before every test method
    end