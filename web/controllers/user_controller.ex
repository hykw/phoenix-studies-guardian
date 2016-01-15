defmodule GuardianStudy.UserController do
  use GuardianStudy.Web, :controller

  alias Guardian.Plug.EnsureAuthenticated
  alias Guardian.Plug.EnsurePermissions

  plug EnsureAuthenticated, [handler: GuardianStudy.GuardianAuthenticateHandler] when action in [:index]
  plug EnsurePermissions, [handler: GuardianStudy.GuardianPermisionHandler, user: ~w(read)]  when action in [:read]
  plug EnsurePermissions, [handler: GuardianStudy.GuardianPermisionHandler, user: ~w(write)]  when action in [:write]

  def index(conn, _params) do
    render conn, "index.html", [msg: "/index"]
  end

  def read(conn, _params) do
    render conn, "index.html", [msg: "/read"]
  end
  def write(conn, _params) do
    render conn, "index.html", [msg: "/write"]
  end


end
