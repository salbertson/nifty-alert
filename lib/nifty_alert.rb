require "faraday"

class NiftyAlert
  SERVICE_URL = "https://nifty-alert-production.herokuapp.com/alerts"

  def initialize(description)
    @description = description
  end

  def report(number, threshold)
    if number > threshold
      Faraday.post(
        SERVICE_URL,
        description: @description,
        recipients: self.class.recipients.join(","),
        current_number: number,
        threshold: threshold
      )
    end
  rescue => error
    if self.class.debug
      puts error
    end

    nil
  end

  def self.recipients=(*recipients)
    @recipients = recipients
  end

  def self.recipients
    @recipients
  end

  def self.debug=(debug)
    @debug = debug
  end

  def self.debug
    @debug
  end
end
