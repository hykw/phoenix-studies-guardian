defmodule GuardianStudy.GuardianPermisionHandler do
  use GuardianStudy.Web, :controller

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "権限が不足しています")
    |> redirect(to: page_path(conn, :index))
  end
end

