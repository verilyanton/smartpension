require 'ipaddress'

class IpDomain
  attr_reader :address

  def initialize(address)
    @address = address.strip
  end

  def valid?
    IPAddress.valid? @address
  end

  def attrs
    { 'address' => @address }
  end
end
