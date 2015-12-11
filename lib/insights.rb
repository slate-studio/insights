require "jobs/send_google_analytics_event_job"

module Insights
  class Engine < ::Rails::Engine
    require "insights/engine"
  end
end
