require 'ipaddress'

class IpDomain
  attr_reader :address

  def initialize(address)
    @address = address.strip if address.is_a? String
  end

  def valid?
    IPAddress.valid? @address
  end

  def attrs
    { 'address' => @address }
  end
end
