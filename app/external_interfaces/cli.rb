require_relative 'base'
require './app/core/use_cases/parse_webserver_log'

module ExternalInterfaces
  class Cli < ExternalInterfaces::Base
    def execute_use_case(args)
      raise ArgumentError, 'Use case slug is missing' if args.empty?
      raise ArgumentError, 'Data provider slug is missing' if args.count == 1
      raise ArgumentError, 'Data source is missing' if args.count == 2

      case args[0]
      when 'parse_webserver_log'
        use_case = UseCases::ParseWebserverLog.new(
          data_provider_slug: args[1][2..],
          data_source: args[2],
          cache: args.count > 3 && args[3] == '--cache'
        )

        views_counts, unique_views_counts = use_case.execute

        if views_counts.empty?
          puts 'No valid page views'
        else
          puts 'List of webpages ordered from most pages views to less page views:'
          views_counts.each { |uri_path, views| puts "#{uri_path} #{views} visits" }

          puts '', '', 'List of webpages ordered from most unique pages views to less:'
          unique_views_counts.each do |uri_path, views|
            puts "#{uri_path} #{views} visits"
          end
        end
      else
        raise ArgumentError, 'Please, provide a valid use case slug'
      end
    end
  end
end
