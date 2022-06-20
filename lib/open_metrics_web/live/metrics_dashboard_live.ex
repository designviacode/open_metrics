defmodule OpenMetricsWeb.MetricsDashboardLive do
  use OpenMetricsWeb, :live_view
  import Number.Currency
  import Number.Delimit

  def mount(_params, _session, socket) do
    githubStars = Enum.random(1..9999)
    twitterFollowers = Enum.random(1..9999)
    mailchimpSubscribers = Enum.random(1..999)
    websitePageViews = Enum.random(1..999999)
    basicSales = Enum.random(1..2000)
    proSales = Enum.random(1..999999)

    socket = assign(socket, :metrics, [
      %{ name: "GitHub Stars", value: number_to_delimited(githubStars) },
      %{ name: "Twitter Followers", value: number_to_delimited(twitterFollowers) },
      %{ name: "Mailchimp Subscribers", value: number_to_delimited(mailchimpSubscribers) },
      %{ name: "Website Pageviews", value: number_to_delimited(websitePageViews) },
      %{ name: "BASIC - Sales", value: number_to_currency(basicSales) },
      %{ name: "PRO - Sales", value: number_to_currency(proSales) },
    ])
    # 24630.92
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="gradient-border fixed top-0" />
      <div class="pa3 pa5-ns flex flex-column">
        <div class="flex-column text-left mb4">
          <h1 class="white mt3 mb0">Open Dashboard</h1>
          <p class="moon-gray opacity-70">
            operates fully transparent and shares its metrics with the community.
          </p>
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
end
