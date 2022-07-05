 module Lauchers
  class FetchLaunchData
    include HTTParty
    base_uri 'http://ll.thespacedevs.com/'

    def initialize(limit, page)
      @options = { limit: limit, query: { page: page }  }
    end

    def call
      date = DateTime.now
      general['results']
    end

    private

    def general
      self.class.get("/2.2.0/launch", @options)
    end


  end
end
