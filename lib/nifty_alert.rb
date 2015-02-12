require "faraday"

class NiftyAlert
  SERVICE_URL = "https://nifty-alert-production.herokuapp.com/alerts"

  def initialize(id)
    @id = id
  end

  def report(number, threshold)
    if number > threshold
      Faraday.post(SERVICE_URL, id: @id, recipients: self.class.recipients)
    end
  rescue
    nil
  end

  def self.recipients=(*recipients)
    @recipients = recipients
  end

  def self.recipients
    @recipients
  end
end
