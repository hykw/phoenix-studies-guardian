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
        |> put_session(:current_user, user.id)
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
    |> delete_session(:current_user)
    |> put_flash(:info, "ログアウトしました")
    |> redirect(to: page_path(conn, :index))
  end


end
