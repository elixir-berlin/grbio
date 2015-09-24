defmodule Grbio.User do
  use Grbio.Web, :model

  schema "users" do
    field :email, :string
    field :bio, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    timestamps
  end

  @required_fields ~w(email bio crypted_password)
  @optional_fields ~w()
  @login_fields ~w(email password)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def login_changeset(model, params \\ :empty) do
    model
    |> cast(params, @login_fields)
  end

  def from_email(nil), do: { :error, :not_found }
  def from_email(email) do
    Repo.one(User, email: email)
  end
end
