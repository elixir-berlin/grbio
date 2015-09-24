defmodule Grbio.PageControllerTest do
  use Grbio.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Grbio!"
  end
end
