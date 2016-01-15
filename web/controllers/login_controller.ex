defmodule GuardianStudy.LoginController do
  use GuardianStudy.Web, :controller
  alias GuardianStudy.User

  def new(conn, _params) do
    render conn, "new.html"
  end


  def create(conn, %{"login" => session_params}) do
    case GuardianStudy.Login.login(session_params, GuardianStudy.Repo) do
      {:ok, user} ->
        set_params = case user.id do
          1 -> %{admin: [:admin_read, :admin_write]}
          2 -> %{admin: [:admin_write]}
          3 -> %{admin: [:admin_read]}

          4 -> %{user: [:read, :write]}
          5 -> %{user: [:write]}
          6 -> %{user: [:read]}
        end

        conn
        |> Guardian.Plug.sign_in(user, :token, perms: set_params)
        |> put_flash(:info, "ログインしました(id = " <> to_string(user.id) <> ")")
        |> redirect(to: page_path(conn, :index))

      :error ->
        conn
        |> put_flash(:info, "メールアドレスもしくはパスワードが間違っています")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> put_flash(:info, "ログアウトしました")
    |> redirect(to: page_path(conn, :index))
  end


end
