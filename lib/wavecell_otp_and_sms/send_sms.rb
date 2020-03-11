require 'httparty'
require 'net/http'
require 'uri'

module WavecellOtpAndSms
  class SendSms
    include HTTParty
    attr_accessor :source, :destination, :text, :encoding

    # Initialize SMS parameters to send message to api
    def initialize(options = {})
      @source = options[:source]
      @destination = options[:destination]
      @text = options[:text]
      @encoding = options[:encoding]
    end

    # Call this to generate url for the api calls
    def send
      generate_url
    end

    private
      # Construct API using the parameters and initial configuration
      def generate_url
        api_key = WavecellOtpAndSms.configuration.api_key
        sub_account = WavecellOtpAndSms.configuration.sub_account
        details = [source, destination, text, encoding]
        parameters = {
          source: source,
          destination: destination,
          text: text,
          encoding: encoding
        }

        uri = URI.parse("https://api.wavecell.com/sms/v1/#{sub_account}/single")
        request = Net::HTTP::Post.new(uri)
        user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36'
        request.initialize_http_header({"User-Agent" => user_agent})
        request.content_type = "application/json"
        request["Authorization"] = "Bearer #{api_key}"
        request.body = "${ \"source\": \"#{source}\", \"destination\": \"#{destination}\", \"text\": \"#{text}\", \"encoding\": \"#{encoding}\" }"

        req_options = {
          use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end
      end

  end
end
