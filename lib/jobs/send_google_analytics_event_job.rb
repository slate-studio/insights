class SendGoogleAnalyticsEventJob
  @queue = :ga_events

  def self.perform(data)
    (1..5).each do
      data_sent = try_to_send(data)
      if data_sent
        return

      else
        sleep 0.25

      end
    end
  end

  def self.try_to_send(data)
    ::GoogleAnalyticsEventsService.send_event(data)
    return true

  rescue
    return false

  end
end
