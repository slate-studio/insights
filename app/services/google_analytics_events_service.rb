require "net/http"

# https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide
# v=1              // Version.
# &tid=UA-XXXXX-Y  // Tracking ID / Property ID.
# &cid=555         // Anonymous Client ID.
# &t=event         // Event hit type
# &ec=video        // Event Category. Required.
# &ea=play         // Event Action. Required.
# &el=holiday      // Event label.
# &ev=300          // Event value.

class GoogleAnalyticsEventsService
  def self.send_event(params={})
    params["v"]   = 1
    params["tid"] = Rails.application.secrets.ga_id
    params["aip"] = 1
    params["t"]   = "event"

    uri = URI.parse("http://www.google-analytics.com/collect")
    res = Net::HTTP.post_form(uri, params)
  end
end
