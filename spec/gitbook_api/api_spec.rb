require 'spec_helper'

describe GitBook::API do
  let(:tester_username) { 'gitbookreader-tester' }

  describe GitBook::API::Stars do
    describe '#list' do
      it "should request user's stars and convert to json format" do
        stars = GitBook.api.stars.list tester_username
        expected_json = [
            {
                id: 'test',
                author: 'calvin-huang',
                title: 'Test book for GitBookReader',
                description:
'iOS repo - https://github.com/Calvin-Huang/GitbookReader-iOS
 Rails repo - https://github.com/Calvin-Huang/GitbookReader
 This repo will not remove for unit test,',
            }
        ].to_json

        expect(stars).to eq(expected_json)
      end
    end
  end
end