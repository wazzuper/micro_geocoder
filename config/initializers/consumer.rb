# frozen_string_literal: true

channel = RabbitMq.consumer_channel
queue = channel.queue('geocoding', durable: true)

# aknowledge
queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON(payload)
  coordinates = Geocoder.call(payload['city'])

  if coordinates.present?
    client = AdsRpc::Client.fetch
    client.update_coordinates(payload['id'], coordinates)
  end

  channel.ack(delivery_info.delivery_tag)
end
