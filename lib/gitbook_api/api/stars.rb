require 'faraday'
require 'nokogiri'
require 'json'

module GitBook
  class API
    module Stars
      def stars(username = nil)
        response = Faraday.get "#{base_url}/@#{username}/starred"

        html_doc = Nokogiri::HTML(response.body)
        books = html_doc.css('#AuthorProfile .Books:first-child .Book')
        books.map do |book|
          anchor = book.css('h4.title > a')
          book_infos = anchor.attr('href').text.split('/')

          {
              id: book_infos.last,
              author: book_infos[book_infos.length - 2],
              title: anchor.text,
              description: book.css('p.description').text
          }
        end
      end
    end
  end
end