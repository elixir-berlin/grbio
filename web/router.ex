defmodule Grbio.Router do
  use Grbio.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Grbio do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", PageController, :login
    get "/create", PageController, :create
    post "/create", PageController, :postcreate
    post "/login", PageController, :postlogin
  end

  # Other scopes may use custom stacks.
  # scope "/api", Grbio do
  #   pipe_through :api
  # end
end
