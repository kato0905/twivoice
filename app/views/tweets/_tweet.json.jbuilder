json.extract! tweet, :id, :name, :time, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
