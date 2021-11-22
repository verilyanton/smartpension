require './app/core/use_cases/parse_webserver_log'

describe UseCases::ParseWebserverLog do
  let(:subject) do
    described_class.new(
      data_provider_slug: 'plain_text_file',
      data_source: 'file.log',
      cache: true
    )
  end

  describe '#count_views' do
    context 'when count_views is called with invalid data' do
      let(:log_data) do
        [
          '/help_page    /1 235.1.1.1',
          '/home 235.1.1.1',
          '/contact 184.123.665.067',
          '/contact ',
        ]
      end

      it 'skips these rows' do
        expect(subject.count_views(log_data)).to eq [{ '/home' => 1 }, { '/home' => 1 }]
      end
    end
  end
end
