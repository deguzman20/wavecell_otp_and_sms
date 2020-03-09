require "wavecell_otp_and_sms/version"
require "wavecell_otp_and_sms/configuration"
require "wavecell_otp_and_sms/send_sms"

module WavecellOtpAndSms
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
