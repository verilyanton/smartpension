require 'yaml'
require './app/adapters/data_providers/plain_text_file'
require './app/adapters/data_providers/json_file'
require './app/core/domains/ip_domain'
require './app/core/domains/uri_domain'
require_relative 'base'

module UseCases
  class ParseWebserverLog < UseCases::Base
    def initialize(data_provider_slug:, data_source:, cache:)
      @data_provider_slug = data_provider_slug
      @data_source = data_source
      @cache = cache
    end

    def execute
      views_counts, unique_views_counts = get_views
      [
        views_counts.sort_by { |_, count| count }.reverse,
        unique_views_counts.sort_by { |_, count| count }.reverse,
      ]
    end

    def get_views
      if @cache
        config = YAML.load_file('./app/config.yml')
        file_dir = config['cache']['file_dir']

        case config['cache']['data_provider']
        when 'json_file'
          data_provider = DataProviders::JsonFile.new
          file_path = "#{file_dir}/views_counts.json"

          if data_provider.exist? file_path
            return data_provider.retrieve(file_path)
          end
        else
          raise ArgumentError, 'Data provider cannot be used'
        end
      end

      views_counts, unique_views_counts = count_views(get_log_data)

      if @cache
        data_provider.save(file_path, [views_counts, unique_views_counts])
      end

      [views_counts, unique_views_counts]
    end

    def get_log_data
      case @data_provider_slug
      when 'plain_text_file'
        DataProviders::PlainTextFile.new.retrieve(@data_source)
      else
        raise ArgumentError, 'Data provider cannot be used'
      end
    end

    def count_views(log_data)
      views_map = {}
      views_counts = {}
      unique_views_counts = {}

      log_data.each do |line|
        uri_path, ip_address = line.split(' ', 2)
        uri = UriDomain.new(uri_path)
        ip = IpDomain.new(ip_address)

        if uri.valid? && ip.valid?
          if views_map.key? uri.path
            views_map[uri.path].append ip.address
          else
            views_map[uri.path] = [ip.address]
          end
        else
          puts "Notice: line #{line} was skipped due to invalid values"
        end
      end

      views_map.each do |uri_path, ip_addresses|
        views_counts[uri_path] = ip_addresses.count
        unique_views_counts[uri_path] = (ip_addresses | []).count
      end

      [views_counts, unique_views_counts]
    end
  end
end
