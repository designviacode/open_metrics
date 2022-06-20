defmodule OpenMetrics.Repo do
  use Ecto.Repo,
    otp_app: :open_metrics,
    adapter: Ecto.Adapters.Postgres
end
