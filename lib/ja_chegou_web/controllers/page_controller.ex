defmodule JaChegouWeb.PageController do
  use JaChegouWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
