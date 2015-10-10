defmodule Grbio.Router do
  use Grbio.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Grbio do
    pipe_through [:browser, :browser_session] # Use the default browser stack

    get "/", PageController, :index
    get "/page_login", PageController, :login
    get "/page_create", PageController, :create
    post "/page_create", PageController, :postcreate
    post "/page_login", PageController, :postlogin

    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
    delete "/logout", SessionController, :delete, as: :logout
    get "/logout", SessionController, :delete, as: :logout

    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Grbio do
  #   pipe_through :api
  # end
end
