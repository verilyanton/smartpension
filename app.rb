require 'pry'
require './app/external_interfaces/cli'

ExternalInterfaces::Cli.new.execute_use_case(ARGV)
