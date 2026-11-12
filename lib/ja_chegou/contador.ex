defmodule JaChegou.Contador do
  def segundos_falta(data_alvo, agora) do
    DateTime.diff(data_alvo, agora)
  end

  def chegou?(segundos) do
    segundos <= 0
  end

  def mensagem(ja_chegou) do
    if ja_chegou do
      "ebaa, ela ja chegou!!!"
    else
      "droga, ainda nao"
    end
  end

  def resposta(data_alvo, agora) do
    data_alvo
    |> segundos_falta(agora)
    |> chegou?()
    |> mensagem()

    # mensagem(chegou?(segundos_falta(data_alvo, agora)))
  end

  def proporcao_restante(segundos_restantes, segundos_totais) do
    segundos_restantes / segundos_totais
  end

  def maior(proporcao_restante) do
    max(proporcao_restante, 0)
  end

  def proporcao_atual(data_inicio, data_alvo, agora) do
    segundos_totais = DateTime.diff(data_alvo, data_inicio)
    segundos_restantes = segundos_falta(data_alvo, agora)
    segundos_restantes = max(segundos_restantes, 0)
    proporcao = proporcao_restante(segundos_restantes, segundos_totais)
    maior(proporcao)
  end

  def distancia(proporcao, distancia_maxima) do
    proporcao * distancia_maxima
  end

  def partes_do_tempo(segundos) do
    dias = div(segundos, 86400)
    resto = rem(segundos, 86400)

    horas = div(resto, 3600)
    resto = rem(resto, 3600)

    minutos = div(resto, 60)
    segundos_finais = rem(resto, 60)

    {dias, horas, minutos, segundos_finais}
  end

  def tempo_em_texto(segundos) do
    {dias, horas, minutos, segundos_finais} = partes_do_tempo(segundos)

    "#{dias}d #{horas}h #{minutos}min #{segundos_finais}s"
  end
end
