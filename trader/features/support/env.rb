require 'aruba/cucumber'
require 'rspec/core'

Before do
  if RUBY_PLATFORM =~ /java/ || defined?(Rubinius)
    @aruba_timeout_seconds = 60
  else
    @aruba_timeout_seconds = 10
  end
end

Aruba.configure do |config|
  config.before_cmd do |cmd|
    set_env('JRUBY_OPTS', "-X-C #{ENV['JRUBY_OPTS']}") # disable JIT since these processes are so short lived
  end
end if RUBY_PLATFORM == 'java'

Aruba.configure do |config|
  config.before_cmd do |cmd|
    set_env('RBXOPT', "-Xint=true #{ENV['RBXOPT']}") # disable JIT since these processes are so short lived
  end
end if defined?(Rubinius)


RSpec.configure do |config|
  # Current version of Cucumber Aruba are not Ready for RSpec 3
  # Including the should syntax to prevent deprecation warnings
  config.expect_with :rspec do |c|
    c.syntax = %i[ expect should ]
  end
end
