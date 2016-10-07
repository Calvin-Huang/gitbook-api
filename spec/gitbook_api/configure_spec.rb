require 'spec_helper'

describe GitBook::Configurable do
  describe '#options' do
    api = GitBook::API.new

    it 'should have options hash map and it have same value with variable' do
      expect(api.options[:base_url]).to eq(api.base_url)
      expect(api.options[:api_url]).to eq(api.api_url)
      expect(api.options[:username]).to eq(api.username)
      expect(api.options[:password]).to eq(api.password)
      expect(api.options[:access_token]).to eq(api.access_token)
    end
  end

  context 'Initialize GitBook::API with default settings' do
    subject do
      GitBook::API.new
    end

    it 'should have default base url' do
      expect(subject.base_url).to eq('https://www.gitbook.com')
      expect(subject.options[:base_url]).to eq('https://www.gitbook.com')
    end

    it 'should have default api url' do
      expect(subject.api_url).to eq('https://api.gitbook.com')
      expect(subject.options[:api_url]).to eq('https://api.gitbook.com')
    end

    it 'should not have usename default' do
      expect(subject.username).to be_nil
      expect(subject.options[:username]).to be_nil
    end

    it 'should not have password default' do
      expect(subject.password).to be_nil
      expect(subject.options[:password]).to be_nil
    end

    it 'should not have access token default' do
      expect(subject.access_token).to be_nil
      expect(subject.options[:access_token]).to be_nil
    end
  end

  context 'Configure with block' do
    let(:base_url) { 'https://enterprise.gitbook.com' }
    let(:api_url) { 'https://api.enterprise.gitbook.com'}
    let(:username) { 'foo' }
    let(:password) { 'boo' }
    let(:access_token) { 'ewjdo1zjqweo123@$6933' }

    subject do
      GitBook.configure do |config|
        config.base_url = base_url
        config.api_url = api_url
        config.username = username
        config.password = password
        config.access_token = access_token
      end

      GitBook.api
    end

    it 'should match base url' do
      expect(subject.base_url).to eq(base_url)
      expect(subject.options[:base_url]).to eq(base_url)
    end

    it 'should match api url' do
      expect(subject.api_url).to eq(api_url)
      expect(subject.options[:api_url]).to eq(api_url)
    end

    it 'should match username' do
      expect(subject.username).to eq(username)
      expect(subject.options[:username]).to eq(username)
    end

    it 'should match password' do
      expect(subject.password).to eq(password)
      expect(subject.options[:password]).to eq(password)
    end

    it 'should match auth_token' do
      expect(subject.access_token).to eq(access_token)
      expect(subject.options[:access_token]).to eq(access_token)
    end
  end

  after(:all) do
    GitBook.reset_configuration
  end
end