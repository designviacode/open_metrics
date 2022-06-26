defmodule TwitterClient do
  use Tesla

  plug Tesla.Middleware.Headers, [
    { "user-agent", "open-metrics-dashboard" },
    { "cache-control", "public, s-maxage=1200, stale-while-revalidate=600" },
    { "Authorization", "Bearer <BEARER_TOKEN>" }
  ]
  plug Tesla.Middleware.JSON

  def get_metrics() do
    twitterUserId = get_user_id()

    {:ok, response} = get("https://api.twitter.com/2/users/" <> twitterUserId <> "?user.fields=public_metrics")
    response
  end

  def get_user_id() do
    userId = "116237534"
    userId
  end

  def get_followers() do
    repo = get_metrics()
    repo
    # repo["stargazers_count"]
  end
end
