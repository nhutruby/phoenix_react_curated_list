defmodule PhoenixReactCuratedListWeb.Router do
  use PhoenixReactCuratedListWeb, :router

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

  scope "/", PhoenixReactCuratedListWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/blogs", BlogController, :index # show all blog posts
    post "/blogs", BlogController, :create # create blog post entry
    get "/blogs/:id", BlogController, :show # show a single blog post
  end

  scope "/api", PhoenixReactCuratedListWeb do
    pipe_through :api
    
    get "/blogs", BlogController, :index
    post "/blogs", BlogController, :create
    get "/blogs/:id", BlogController, :show
    delete "/blogs/:id", BlogController, :delete
    post "/users", UserController, :create
    put "/blogs/:id", BlogController, :update
  end
  # Other scopes may use custom stacks.
  # scope "/api", PhoenixReactCuratedListWeb do
  #   pipe_through :api
  # end
end
