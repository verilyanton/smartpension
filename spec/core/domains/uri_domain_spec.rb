require './app/core/domains/uri_domain'

describe UriDomain do
  valid_path = '/index'
  empty_path = ''
  invalid_path = '/   index'

  describe '#initialize' do
    context 'when provided with a string' do
      it 'creates URI domain object' do
        uri = UriDomain.new(valid_path)

        expect(uri.path).to eq valid_path
      end

    end
  end

  describe '#valid?' do
    context 'when IP domain object is created with a valid URI' do
      it 'validates it' do
        uri = UriDomain.new(valid_path)

        expect(uri.valid?).to be_truthy
      end
    end

    context 'when IP domain object is created with an empty URI' do
      it 'validates it' do
        uri = UriDomain.new(empty_path)

        expect(uri.valid?).to be_truthy
      end
    end

    context 'when IP domain object is created with an invalid URI' do
      it 'does not validate it' do
        uri = UriDomain.new(invalid_path)

        expect(uri.valid?).to be_falsey
      end
    end
  end
end
