defmodule Grbio.UserTest do
  use Grbio.ModelCase

  alias Grbio.User

  @valid_attrs %{bio: "some content", crypted_password: "some content", email: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
