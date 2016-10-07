require 'spec_helper'

describe GitBook::API do
  let(:tester_username) { 'gitbookreader-tester' }

  describe GitBook::API::Stars do
    describe '#list' do
      it "should request user's stars and convert to json format" do
        stars = GitBook.api.stars tester_username
        expected_data = [
            {
                id: 'test',
                author: 'calvin-huang',
                title: 'Test book for GitBookReader',
                description: "iOS repo - https://github.com/Calvin-Huang/GitbookReader-iOS\r\nRails repo - https://github.com/Calvin-Huang/GitbookReader\r\nThis repo will not remove for unit test,",
            }
        ]

        expect(stars).to eq(expected_data)
      end
    end
  end
end