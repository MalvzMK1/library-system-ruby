# Library System with Ruby
#### In this project, I look for study ruby language, creating a simple libary system.
- || operator can validate if some value comes ```nil``` to return a default value
## MVC -> Model, View, Controller
## TDD -> Test Driven Development
### In this project, I used minitest from ruby to make the unit tests.
### Script to run the test file
    ruby -I. ./test/test_file_name.rb
- -I param specify a path to include aditional directories in the charge (This is usefull to ruby to find test file's dependencies around the code)
### Minitest notes...
#### Defining a minitest's test class 
    class TestSomething < Minitest::Test
      # Here comes your test methods!!!
    end
---
#### Defining a setup method
##### A setup method runs before every test method in the class
    def setup
      # Here comes your setup code!!!
      # Ex: Define a repository class instance
    end
---
#### Defining a teardown method
##### Unlike setup method, the teardown will run after every test method from the class
    def teardown
      # Here comes your teardown code!!!
      # Ex: Clear a local test database
    end
---
#### Assertions
##### Assertions are the affirmations that you write in your test, there are some different assertions inside Minitest
---
    assert(condition)
##### This one `expects` the condition to be `true`
---
    refute(condition)
##### Unlike assert, it `expects` the condition to be `false`
---
    assert_equal(value, compared_value)
##### This one will compare two values, `expecting they are the same`, if they are the same the test will pass, otherwise, it will fail
---
    refute_equal(value, compared_value)
##### Following the same logic, it will expect that these two values are `NOT` the `same`
---
    assert_nil(value)
##### This one will `expect` the value to be `nil`
---
    refute_nil(value)
##### This will `expect` the value `NOT` to be `nil`
---
    assert_raises(Exception) do
      # code that will launch that exception
    end
##### This will `expect` that one `especific exception` will be thrown from the code block
---
    assert_in_delta(expected_value, provided_value, tolerance)
##### This will `expect` that the provided `value` is `inside the tolerance` provided in the param of the assertion, it is used to validate numbers
---
#### Minitest Spec
##### With this gem is possible to write tests in a different way <br>Ex:
    describe 'MyClass' do
      it 'does something' do
        # MyClass related test
      end
    end
##### `describe` is used to create a test group, it is useful to create your tests in a much clearer way
---
    describe 'MyClass' do
      context 'when in a specific state' do
        it 'does something' do
          # Teste relacionado a MyClass em um estado específico
        end
      end
    end
##### `context` is used to create a test context inside the describe block to `group tests` with common contexts
---
### Code Coverage
#### In this project, I also used simplecov gem for code coverage study
    require 'simplecov'

    SimpleCov.start do
      add_group 'Tests', 'app/tests'
      add_group 'Controllers', 'app/controllers'
      add_group 'Models', 'app/models'
      add_group 'Repositories', 'app/repositories'
      add_group 'Entry Point', 'app/main'
    end
#### Needs to be initialized before every test