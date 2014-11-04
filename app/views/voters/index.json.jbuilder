json.array!(@voters) do |voter|
  json.extract! voter, :id, :name,, :party
  json.url voter_url(voter, format: :json)
end
