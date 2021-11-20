require './app/core/domains/uri_domain'

describe UriDomain do
  valid_path = '/index'
  empty_path = ''
  invalid_path = '/   index'

  it 'creates URI domain object' do
    uri = UriDomain.new(valid_path)

    expect(uri.path).to eq valid_path
  end

  it 'validates valid URI' do
    uri = UriDomain.new(valid_path)

    expect(uri.valid?).to be_truthy
  end

  it 'validates empty URI' do
    uri = UriDomain.new(empty_path)

    expect(uri.valid?).to be_truthy
  end

  it 'does not validate invalid URI' do
    uri = UriDomain.new(invalid_path)

    expect(uri.valid?).to be_falsey
  end
end
