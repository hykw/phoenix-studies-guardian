defmodule GuardianStudy.User do
  use GuardianStudy.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string

    timestamps
  end

  @required_fields ~w(email password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> update_change(:email, &String.downcase/1)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 2, max: 4)

  end


  def create(changeset, repo) do
    changeset
    |> repo.insert()
  end

end
