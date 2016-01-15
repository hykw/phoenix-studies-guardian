defmodule GuardianStudy.AdminController do
  use GuardianStudy.Web, :controller


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
