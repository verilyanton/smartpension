# frozen_string_literal: true

require 'uri'

class UriDomain
  # for simplicity, we are using only path attribute now
  # but in case of a real application query and fragment should be added
  attr_reader :path

  def initialize(path)
    @path = path.strip
  end

  def valid?
    # there must be a better way to do this validation
    uri = URI.parse(@path)
    uri.path == @path

  rescue URI::InvalidURIError
    false
  end

  def attrs
    { 'path' => @path }
  end
end
