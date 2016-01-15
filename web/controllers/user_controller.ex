defmodule GuardianStudy.UserController do
  use GuardianStudy.Web, :controller

  alias Guardian.Plug.EnsureAuthenticated
  alias Guardian.Plug.EnsurePermissions


  plug EnsureAuthenticated, [handler: __MODULE__, key: :default, typ: "token"]
    plug EnsurePermissions, [handler: __MODULE__, default: ~w(read)]  when action in [:index]

    use Guardian.Phoenix.Controller


  def index(conn, params, current_user, claims) do
  #  def index(conn, _params) do
  #  IO.inspect Guardian.Permissions.to_value([:read], :default)
  IO.inspect Guardian.Permissions.from_claims(claims)



    render conn, "index.html"
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "まずログインしてください")
    |> redirect(to: page_path(conn, :index))
  end

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "/userへのアクセスには、ユーザ権限かadmin権限が必要")
    |> redirect(to: page_path(conn, :index))
  end

end
