defmodule JaChegouWeb.Router do
  use JaChegouWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {JaChegouWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JaChegouWeb do
    pipe_through :browser

    live "/", ContadorLive
    live "/nova-data", NovaDataLive
  end
end
