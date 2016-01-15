defmodule GuardianStudy.UserController do
  use GuardianStudy.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
