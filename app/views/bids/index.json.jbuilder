json.array!(@bids) do |bid|
  json.extract! bid, :id, :amount, :item_id, :user_id
  json.url bid_url(bid, format: :json)
end
