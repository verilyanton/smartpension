require './app/adapters/data_providers/plain_text_file'

describe DataProviders::PlainTextFile do

  file_path = 'spec/stubs/file.json'
  raw_data = "/home 126.318.035.038\n/about/2 543.910.244.929\n"
  lines = ['/home 126.318.035.038', '/about/2 543.910.244.929']

  describe '#retrieve' do
    context 'when provided with file path' do
      it 'retrieves the file and returns array of text lines' do
        allow(File).to receive(:read).and_return(raw_data)
        result = DataProviders::PlainTextFile.new.retrieve(file_path)

        expect(result).to eq lines
      end
    end
  end
end
