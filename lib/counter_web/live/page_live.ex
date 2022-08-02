defmodule CounterWeb.PageLive do
  use CounterWeb, :live_view

  # mount function is called once when the liveview web first connect to the server
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(number: 0)}
  end

  # @spec render(any) :: Phoenix.LiveView.Rendered.t()
  # def render(assigns) do
  #   ~L"""
  #   <h1>Count: <%= @count %></h1>
  #   <button>+</button>
  #   <button>-</button>
  #   """
  # end
  def handle_event("inc", _params, socket) do
    {:noreply,
     socket
     |> update(:number, &(&1 + 1))}
  end

  def handle_event("clear", _params, socket) do
    {:noreply, socket |> assign(number: 0)}
  end

  def handle_event("dec", _params, socket) do
    {:noreply,
     socket
     |> update(:number, &max(0, &1 - 1))}
  end


end
