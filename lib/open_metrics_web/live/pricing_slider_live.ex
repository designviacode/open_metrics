defmodule OpenMetricsWeb.PricingSliderLive do
  use OpenMetricsWeb, :live_view

  import Number.Currency

  def mount(_params, _session, socket) do
    socket = assign(socket,
      seats: 1,
      amount: calculate(1),
      planName: "basic",
      planCost: 15
    )
    {:ok, socket}
  end

  def calculate(seats) do
    seats * 20
  end

  def render(assigns) do
    ~H"""
      <div>
        <h1>Pricing</h1>

        <div style="display: flex; justify-content: center;">
          <button
            phx-click="planType"
            phx-value-plan-name="basic"
            class="f6 link dim br1 ph3 pv2 mr1 mb2 dib white bg-black"
          >
            BASIC
          </button>
          <button
            phx-click="planType"
            phx-value-plan-name="pro"
            class="f6 link dim br1 ph3 pv2 mr1 mb2 dib white bg-black"
          >
            PRO
          </button>
          <button
            phx-click="planType"
            phx-value-plan-name="advanced"
            class="f6 link dim br1 ph3 pv2 mr1 mb2 dib white bg-black"
          >
            ADVANCED
          </button>
        </div>

        <p style="text-align: center;">
          Your plan is <b><%= String.upcase(@planName) %></b> license is currently for <b><%= @seats %></b> seats
        </p>
        <form phx-change="update">
          <input
            type="range"
            min="1"
            max="10"
            name="seats"
            value={{@seats}}
          />
        </form>
        <h1>Total: <%= number_to_currency(@amount) %> / monthly</h1>
      </div>
    """
  end

  def handle_event("update", %{ "seats" => seats }, socket) do
    seats = String.to_integer(seats)
    socket =
      assign(socket,
        seats: seats,
        amount: calculate(seats)
      )
    {:noreply, socket}
  end

  def handle_event("planType", %{ "plan-name" => planName }, socket) do
    socket = assign(socket, planName: planName)
    {:noreply, socket}
  end
end
