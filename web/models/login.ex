defmodule GuardianStudy.Login do
  alias GuardianStudy.User

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> password == user.password
    end
  end


  def current_user(conn) do

    case Guardian.Plug.current_resource(conn) do
      %{id: id} -> GuardianStudy.Repo.get(User, id)
      _ -> false
    end

  end


  def logged_in?(conn) do
    !!current_user(conn)
  end



end

