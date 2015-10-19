require 'spec_helper'

require 'rmqf/mock'

describe Rmqf::Mock::Adapter::Base do

  before {
    class DummyAdapter < Rmqf::Mock::Adapter::Base

      def initialize(representation)
        @representation = representation
      end

      def mqf_representation
        @representation
      end

      def required_keys
        ['k1', 'k2', 'k3']
      end

    end
  }

  describe '.to_rmqf' do

    subject { -> { DummyAdapter.new(representation).to_rmqf } }

    context 'when there is a key missing' do

      let(:representation) { { 'k1' => 'v1', 'k2' => 'v2' } }

      it { should raise_error(ArgumentError) }

    end

    context 'when all keys are present' do

      let(:representation) { { 'k1' => 'v1', 'k2' => 'v2', 'k3' => 'v3' } }

      it { should_not raise_error }

      it 'return a Hash' do
        expect(subject.call).to be_kind_of Hash
      end

    end

  end

end
