defmodule GuardianStudy.RegisterController do
  use GuardianStudy.Web, :controller
  alias GuardianStudy.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case User.create(changeset, GuardianStudy.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "アカウントを作成(メールアドレス = " <> changeset.params["email"] <> ")")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:info, "アカウント作成失敗")
        |> render("new.html", changeset: changeset)
    end

  end

end
