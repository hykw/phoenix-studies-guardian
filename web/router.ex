defmodule GuardianStudy.Router do
  use GuardianStudy.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    # Looks for a token in the Authorization header. Useful for apis. If one is not found, this does nothing.
    plug Guardian.Plug.VerifyHeader

    plug Guardian.Plug.LoadResource
  end


  pipeline :browser_session do
    # Looks for a token in the session. Useful for browser sessions. If one is not found, this does nothing.
    plug Guardian.Plug.VerifySession

    plug Guardian.Plug.LoadResource
  end




  scope "/", GuardianStudy do
    pipe_through [:browser, :browser_session] # Use the default browser stack


    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuardianStudy do
  #   pipe_through :api
  # end
end
