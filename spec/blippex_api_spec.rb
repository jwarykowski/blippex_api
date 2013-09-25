require 'helper'

describe BlippexAPI do

  describe 'when called' do
    it 'should be an instance of Module' do
      BlippexAPI.should be_an_instance_of Module
    end
  end

  describe '.new' do
    it 'is a BlippexAPI::Client' do
      expect(BlippexAPI.new).to be_a BlippexAPI::Client
    end
  end

  describe '.respond_to?' do
    it 'returns true if new method exists' do
      expect(BlippexAPI.respond_to?(:new, true)).to eq(true)
    end
  end

end