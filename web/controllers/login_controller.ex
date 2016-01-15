defmodule GuardianStudy.LoginController do
  use GuardianStudy.Web, :controller
  alias GuardianStudy.User

  def new(conn, _params) do
    render conn, "new.html"
  end


  def create(conn, %{"login" => session_params}) do
    case GuardianStudy.Login.login(session_params, GuardianStudy.Repo) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user, :token, key: :default, perms: %{default: Guardian.Permissions.max})
        |> put_flash(:info, "ログインしました(id = " <> to_string(user.id) <> ")")
        |> redirect(to: page_path(conn, :index))

        #        |> Guardian.Plug.sign_in(user, :token, key: :default, perms: %{default: [:read]})
        #        |> Guardian.Plug.sign_in(user, :token, perms: %{default: Guardian.Permissions.max})
        #|> Guardian.Plug.sign_in(user, :token, key: :default, perms: %{default: [:read, :write]})
        #        |> Guardian.Plug.sign_in(user, :token, key: :admin, perms: %{default: Guardian.Permissions.max})


      :error ->
        conn
        |> put_flash(:info, "メールアドレスもしくはパスワードが間違っています")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "ログアウトしました")
    |> redirect(to: page_path(conn, :index))
  end


end
