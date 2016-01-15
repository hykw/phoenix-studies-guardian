defmodule GuardianStudy.PageController do
  use GuardianStudy.Web, :controller
  use Guardian.Phoenix.Controller


  def index(conn, params, current_user, claims) do

# IO.inspect current_user
# IO.inspect "==============="
# IO.inspect claims


    render conn, "index.html"
  end
end
