require 'spec_helper'

describe Rmqf do

  describe '.configure' do

    before { Rmqf.clear_configuration }

    subject {
      Rmqf.configure do |c|
        c.consumer_key = 'XCK'
        c.consumer_secret = 'XCS'
        c.access_token = 'XAT'
        c.access_secret = 'XAS'
      end
    }

    it 'should set the consumer_key' do
      expect {
        subject
      }.to change(Rmqf.configuration, :consumer_key).from(nil).to('XCK')
    end

    it 'should set the consumer_secret' do
      expect {
        subject
      }.to change(Rmqf.configuration, :consumer_secret).from(nil).to('XCS')
    end

    it 'should set the access_token' do
      expect {
        subject
      }.to change(Rmqf.configuration, :access_token).from(nil).to('XAT')
    end

    it 'should set the access_secret' do
      expect {
        subject
      }.to change(Rmqf.configuration, :access_secret).from(nil).to('XAS')
    end

  end

end
