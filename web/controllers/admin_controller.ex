defmodule GuardianStudy.AdminController do
  use GuardianStudy.Web, :admin_controller

  #  plug EnsureAuthenticated, [handler: GuardianStudy.GuardianAdminAuthenticateHandler] when action in [:index]
  plug EnsurePermissions, [handler: GuardianStudy.GuardianPermisionHandler, admin: ~w(admin_read)]  when action in [:read]
  plug EnsurePermissions, [handler: GuardianStudy.GuardianPermisionHandler, admin: ~w(admin_write)]  when action in [:write]


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
