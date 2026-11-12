defmodule JaChegouWeb.NovaDataLive do
  use JaChegouWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <form phx-submit="salvar">
      <input type="datetime-local" name="alvo" />
      <button type="submit">Salvar</button>
    </form>
    """
  end
end
