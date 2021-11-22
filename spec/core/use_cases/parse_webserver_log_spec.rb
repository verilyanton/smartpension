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
    context 'when called with valid data' do
      let(:log_data) do
        [
          '/home 1.1.1.1',
          '/home 1.1.1.1',
          '/home 1.1.1.1',
          '/contact 2.2.2.2',
          '/contact 3.3.3.3',
        ]
      end

      it 'returns counted views' do
        expect(subject.count_views(log_data)).
          to eq([{ '/home' => 3, '/contact' => 2 }, { '/home' => 1, '/contact' => 2 }])
      end
    end

    context 'when called with invalid data' do
      let(:log_data) do
        [
          '/help_page    /1 235.1.1.1',
          '/home 235.1.1.1',
          '/contact 184.123.665.067',
          '/contact ',
        ]
      end

      it 'skips rows with invalid data' do
        expect(subject.count_views(log_data)).to eq [{ '/home' => 1 }, { '/home' => 1 }]
      end
    end
  end

  describe '#sort_views' do
    context 'when called with views_count array' do
      let(:views_count) do
        [{ '/home' => 3, '/contact' => 2 }, { '/home' => 1, '/contact' => 2 }]
      end

      it 'sorts each count descending' do
        expect(subject.sort_views(views_count)).
          to eq([[['/home', 3], ['/contact', 2]], [['/contact', 2], ['/home', 1]]])
      end
    end
  end
end
