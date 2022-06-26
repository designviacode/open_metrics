defmodule OpenMetricsWeb.MetricsSettingsLive do
  use OpenMetricsWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="gradient-border fixed top-0" />
    <div class="pa3 pa5-ns flex flex-column">
      <div class="flex justify-between mt3">
        <div class="flex-column text-left mb4">
          <h1 class="white mb0">Settings</h1>
        </div>
      </div>

      <div class="flex w-100">
        <nav class="pt4 pl2-ns">
          <a class="link dim white tracked b dib mr3" href="#" title="Configure your Account">Account</a>
          <a class="link dim silver tracked dib mr3" href="#integrations" title="Configure your Integrations">Integrations</a>
          <a class="link dim silver tracked dib mr3" href="#metrics" title="Select Metrics for your Dashboard">Metrics</a>
        </nav>
      </div>
    </div>
    """
  end
end
