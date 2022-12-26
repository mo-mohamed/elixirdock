defmodule ElixirdockWeb.PageController do
  use ElixirdockWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
