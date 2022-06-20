defmodule OpenMetricsWeb.PageController do
  use OpenMetricsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
