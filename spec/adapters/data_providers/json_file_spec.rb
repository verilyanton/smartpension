require './app/adapters/data_providers/json_file'

describe DataProviders::JsonFile do

  file_path = 'spec/stubs/file.json'
  data = { 'name' => 'John' }
  json_data = '{"name":"John"}'

  describe '#retrieve' do
    context 'when provided with file path' do
      it 'retrieves the file and returns parsed json' do
        allow(File).to receive(:read).and_return(json_data)
        result = DataProviders::JsonFile.new.retrieve(file_path)

        expect(result).to eq data
      end
    end
  end

  describe '#save' do
    context 'when provided with file path and data' do
      it 'converts the data to json and writes it to the file' do
        allow(File).to receive(:write)
        result = DataProviders::JsonFile.new.save(file_path, data)

        expect(result).to eq json_data
      end
    end
  end
end
