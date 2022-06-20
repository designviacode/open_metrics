defmodule OpenMetricsWeb.CounterLive do
  use OpenMetricsWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :count, 0)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <div>
        <h1>Count: <%= @count %></h1>
        <button style="padding: 10px;" phx-click="increment">+</button>
        <button style="padding: 10px;" phx-click="incrementBy10">+10</button>
        <button style="padding: 10px;" phx-click="decrement">-</button>
        <button style="padding: 10px;" phx-click="decrementBy10">-10</button>
        <button style="padding: 10px;" phx-click="some">RANDOM</button>
      </div>
    """
  end

  def handle_event("increment", _, socket) do
    socket = update(socket, :count, &(&1 + 1))
    {:noreply, socket}
  end

  def handle_event("decrement", _, socket) do
    socket = update(socket, :count, &(&1 - 1))
    {:noreply, socket}
  end

  def handle_event("incrementBy10", _, socket) do
    socket = update(socket, :count, &(&1 + 10))
    {:noreply, socket}
  end

  def handle_event("decrementBy10", _, socket) do
    socket = update(socket, :count, &(&1 - 10))
    {:noreply, socket}
  end

  def handle_event("some", _, socket) do
    socket = assign(socket, :count, Enum.random(0..10))
    {:noreply, socket}
  end
end
