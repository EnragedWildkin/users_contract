ENV['RAILS_ENV'] = 'test'
require 'simplecov'
SimpleCov.start 'rails'
puts 'required simplecov'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest/pride'
require 'mocha/mini_test'
Minitest::Reporters.use!
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# To add Capybara feature tests add `gem 'minitest-rails-capybara'`
# to the test group in the Gemfile and uncomment the following:
# require 'minitest/rails/capybara'

Dir[Rails.root.join('test/support/*.rb')].each { |f| require f }
class ActiveSupport::TestCase
  fixtures :all
  include SignInHelper
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller
end
