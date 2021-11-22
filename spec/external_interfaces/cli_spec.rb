require './app/external_interfaces/cli'
require './app/core/use_cases/parse_webserver_log'

describe ExternalInterfaces::Cli do
  describe '#execute_use_case' do
    context 'when called with parse_webserver_log argument' do
      it 'executes ParseWebserverLog and returns from it' do
        allow_any_instance_of(UseCases::ParseWebserverLog).
          to receive(:execute).and_return([{ 'one' => 1 }, { 'two' => 2 }])

        result = ExternalInterfaces::Cli.new.
          execute_use_case(%w[parse_webserver_log arg1 arg2])

        expect(result).to eq({ 'two' => 2 }) # last array element
      end
    end
  end
end
