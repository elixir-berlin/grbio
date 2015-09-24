defmodule Grbio.PageController do
  use Grbio.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
