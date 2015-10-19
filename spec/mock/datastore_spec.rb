require 'spec_helper'

require 'rmqf/mock'

describe Rmqf::Mock::Datastore do

  describe '.get_subscriptions' do

    subject { Rmqf::Mock::Datastore.new.get_subscriptions }

    it 'should raise a RuntimeError' do
      expect {
        subject
      }.to raise_error RuntimeError
    end

  end

  describe '.get_subscribers' do

    subject { Rmqf::Mock::Datastore.new.get_subscribers }

    it 'should raise a RuntimeError' do
      expect {
        subject
      }.to raise_error RuntimeError
    end

  end

  describe '.get_carriers' do

    subject { Rmqf::Mock::Datastore.new.get_carriers }

    it 'should raise a RuntimeError' do
      expect {
        subject
      }.to raise_error RuntimeError
    end

  end

  describe '.get_shortcodes' do

    subject { Rmqf::Mock::Datastore.new.get_shortcodes }

    it 'should raise a RuntimeError' do
      expect {
        subject
      }.to raise_error RuntimeError
    end

  end

end
