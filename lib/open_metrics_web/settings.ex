defmodule Settings do
  # use Tesla
  # plug Tesla.Middleware.Headers, [{ "user-agent", "my-app" }]
  # plug Tesla.Middleware.JSON

  def get_github_repo_stars() do
    GithubClient.get_repo_stars()
  end

  def get_twitter_followers() do
    TwitterClient.get_metrics()
  end

  # def get_twitter_metrics() do
  #   twitterUserId = '116237534'
  #   {:ok, response} = get("https://api.twitter.com/2/users/" <> twitterUserId <> "?user.fields=public_metrics")
  # end
end
