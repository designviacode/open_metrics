defmodule GithubClient do
  use Tesla

  plug Tesla.Middleware.Headers, [{ "user-agent", "open-metrics-dashboard" }]
  plug Tesla.Middleware.JSON

  def get_repo() do
    githubUserName = get_user_name()
    githubRepoName = get_repo_name()

    {:ok, response} = get("https://api.github.com/users/" <> githubUserName <> "/repos")

    repo = response.body
    |> Enum.find(fn m ->
      m["name"] == githubRepoName
    end)

    repo
  end

  def get_user_name() do
    githubUserName = "designviacode"
    githubUserName
  end

  def get_repo_name() do
    githubRepoName = "geneos"
    githubRepoName
  end

  def get_repo_stars() do
    repo = get_repo()
    repo["stargazers_count"]
  end
end
