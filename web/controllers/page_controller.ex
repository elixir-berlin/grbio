defmodule Grbio.PageController do
  use Grbio.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login(conn, _params) do
    render conn, "login.html"
  end

  def create(conn, _params) do
    render conn, "create.html"
  end

  def postlogin(conn, _params) do
    render conn, "successfull.html"
  end

  def postcreate(conn, _params) do
    render conn, "successfull.html"
  end
end
