require 'pathname'

module RSpec
  module_function
  def root
    @rspec_root ||= Pathname.new(__dir__)
  end
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[RSpec.root.join("support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Helpers::Wrapping

  config.filter_run_excluding :wip
  config.run_all_when_everything_filtered = true
  config.order = 'random'
  config.alias_it_should_behave_like_to :has_behavior
  config.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end
