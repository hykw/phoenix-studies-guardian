defmodule GuardianStudy.GuardianAuthenticateHandler do
  use GuardianStudy.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "ログインしてください")
    |> redirect(to: page_path(conn, :index))
  end
end

defmodule GuardianStudy.GuardianAdminAuthenticateHandler do
  use GuardianStudy.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "admin権限でログインしてください")
    |> redirect(to: page_path(conn, :index))
  end
end
