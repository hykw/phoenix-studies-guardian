defmodule GuardianStudy.GuardianToken do
  use GuardianStudy.Web, :model

  alias GuardianStudy.Repo
  alias GuardianStudy.GuardianSerializer

  @primary_key {:jti, :string, []}
  @derive {Phoenix.Param, key: :jti}
  schema "guardian_tokens" do
    field :aud, :string
    field :iss, :string
    field :sub, :string
    field :exp, :integer
    field :jwt, :string
    field :claims, :map

    timestamps
  end

  def for_user(user) do
    case GuardianSerializer.for_token(user) do
      {:ok, aud} ->
        (from t in GuardianStudy.GuardianToken, where: t.sub == ^aud)
          |> Repo.all
      _ -> []
    end
  end
end
