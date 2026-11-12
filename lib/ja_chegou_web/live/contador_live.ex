defmodule JaChegouWeb.ContadorLive do
  use JaChegouWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :tick, 1000)

    socket = assign(socket, :data_alvo, ~U[2026-11-05 15:42:00Z])
    socket = assign(socket, :agora, DateTime.utc_now())
    socket = assign(socket, :data_inicio, DateTime.utc_now())

    {:ok, socket}
  end

  @impl true
  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 1000)

    socket = assign(socket, :agora, DateTime.utc_now())

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="pagina">
      <h1 class="titulo">
        A jhujuba ja chegou?
      </h1>

      <p class="resposta">
        {JaChegou.Contador.resposta(@data_alvo, @agora)}
      </p>

      <div
        :if={not JaChegou.Contador.chegou?(JaChegou.Contador.segundos_falta(@data_alvo, @agora))}
        class="avatar"
        style={"gap: #{JaChegou.Contador.distancia(JaChegou.Contador.proporcao_atual(@data_inicio, @data_alvo, @agora), 35)}vw;"}
      >
        <img src="/images/zoey_avatar.png" style="height: 305px;" />
        <img src="/images/jhene_avatar.png" style="height: 299px;" />
      </div>

      <div
        :if={JaChegou.Contador.chegou?(JaChegou.Contador.segundos_falta(@data_alvo, @agora))}
        class="encontro"
      >
        <img src="/images/encontro.png" style="height: 300px;" />
      </div>

      <p
        :if={not JaChegou.Contador.chegou?(JaChegou.Contador.segundos_falta(@data_alvo, @agora))}
        class="contador"
        faltam
        {JaChegou.Contador.tempo_em_texto(JaChegou.Contador.segundos_falta(@data_alvo, @agora))}
      >
      </p>
    </div>
    """
  end
end
