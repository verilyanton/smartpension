require './app/core/domains/ip_domain'

describe IpDomain do
  valid_ip_address = '192.168.0.1'
  invalid_ip_address = '192.168.0.260'

  describe '#initialize' do
    context 'when provided with a string' do
      it 'creates IP domain object' do
        ip = IpDomain.new(valid_ip_address)

        expect(ip.address).to eq valid_ip_address
      end

    end
  end

  describe '#valid?' do
    context 'when IP domain object is created with a valid IP address' do
      it 'validates it' do
        ip = IpDomain.new(valid_ip_address)

        expect(ip.valid?).to be_truthy
      end

    end

    context 'when IP domain object is created with a invalid IP address' do
      it 'does not validate it' do
        ip = IpDomain.new(invalid_ip_address)

        expect(ip.valid?).to be_falsey
      end
    end
  end
end
