# frozen_string_literal: true

require 'ipaddress'

class IpDomain
  attr_reader :address

  def initialize(address)
    @address = address
  end

  def valid?
    IPAddress.valid? @address
  end
end
