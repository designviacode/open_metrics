defmodule OpenMetricsWeb.MetricsDashboardLive do
  use OpenMetricsWeb, :live_view
  import Number.Currency
  import Number.Delimit

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    socket = assign_stats(socket)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="gradient-border fixed top-0" />
      <div class="pa3 pa5-ns flex flex-column">
        <div class="flex justify-between mt3">
          <div class="flex-column text-left mb4">
            <h1 class="white mb0">Open Dashboard</h1>
            <p class="moon-gray opacity-70">
              operates fully transparent and shares its metrics with the community.
            </p>
          </div>

          <div class="flex">
            <button
              class="bg-mid-gray b--white-20 ph4 mt2 mr3"
              phx-click="refresh"
            >
              Refresh
            </button>
            <a href="/metrics/settings">
              <button class="bg-mid-gray b--white-20 pl4 mt2 flex items-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="ml0 mr2 h2 w2"
                  viewBox="0 0 20 20"
                  fill="darkgrey"
                >
                  <path
                    fill-rule="evenodd"
                    d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z"
                    clip-rule="evenodd"
                  />
                </svg>
                Settings
              </button>
            </a>
          </div>
        </div>

        <div class="flex flex-row flex-wrap justify-between pv3">
          <%= for link <- @metrics do %>
          <div class="w-100 w-100-m w-30-ns bg-white br3 mb4 mb5-ns pa3 pa5-ns tc fw6 tracked dim pointer">
              <h2 class="f2 f1-ns gradient-text">
                <%= link.value %>
              </h2>
              <p class="f4 f3-ns fw5"><%= link.name %></p>
            </div>
          <% end %>
        </div>
      </div>
    """
  end

  def handle_event("refresh", _, socket) do
    socket = assign_stats(socket)
    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    socket = assign_stats(socket)
    {:noreply, socket}
  end

  defp assign_stats(socket) do
    githubRepoStars = Settings.get_github_repo_stars()
    twitterFollowers = Enum.random(1..9999)
    mailchimpSubscribers = Enum.random(1..999)
    websitePageViews = Enum.random(1..999999)
    basicSales = Enum.random(1..2000)
    proSales = Enum.random(1..999999)

    assign(socket, :metrics, [
      %{ name: "GitHub Stars", value: githubRepoStars },
      %{ name: "Twitter Followers", value: number_to_delimited(twitterFollowers) },
      %{ name: "Mailchimp Subscribers", value: number_to_delimited(mailchimpSubscribers) },
      %{ name: "Website Pageviews", value: number_to_delimited(websitePageViews) },
      %{ name: "BASIC - Sales", value: number_to_currency(basicSales) },
      %{ name: "PRO - Sales", value: number_to_currency(proSales) },
    ])
  end
end
