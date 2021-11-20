require './app/core/domains/ip_domain'

describe IpDomain do
  valid_ip_address = '192.168.0.1'
  invalid_ip_address = '192.168.0.260'

  it 'creates IP domain object' do
    ip = IpDomain.new(valid_ip_address)

    expect(ip.address).to eq valid_ip_address
  end

  it 'validates valid IP address' do
    ip = IpDomain.new(valid_ip_address)

    expect(ip.valid?).to be_truthy
  end

  it 'does not validate invalid IP address' do
    ip = IpDomain.new(invalid_ip_address)

    expect(ip.valid?).to be_falsey
  end
end
