defmodule MyTestAppWeb.PageController do
  use MyTestAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def index_api(conn, _params) do
    json conn, "Hey yo"
  end
end
