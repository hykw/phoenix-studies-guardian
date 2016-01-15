defmodule GuardianStudy.UserController do
  use GuardianStudy.Web, :controller

  alias Guardian.Plug.EnsureAuthenticated
  alias Guardian.Plug.EnsurePermissions

  plug EnsureAuthenticated, [handler: __MODULE__] when action in [:index]
  plug EnsurePermissions, [handler: __MODULE__, user: ~w(read)]  when action in [:read]
  plug EnsurePermissions, [handler: __MODULE__, user: ~w(write)]  when action in [:write]

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "ログインしてください")
    |> redirect(to: page_path(conn, :index))
  end

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "権限が不足しています")
    |> redirect(to: page_path(conn, :index))
  end


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
