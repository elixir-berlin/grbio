defmodule UserQuery do
  import Ecto.Query
  alias Grbio.User

  def by_email(email) do
    from u in User, where: u.email == ^email
  end
end
