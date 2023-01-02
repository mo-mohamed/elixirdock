defmodule ElixirdockWeb.PageController do
  use ElixirdockWeb, :controller
  require Logger

  def index(conn, _params) do
    forwarded_for = List.first(Plug.Conn.get_req_header(conn, "x-forwarded-for"))

    ip_address =
      if forwarded_for do
        String.split(forwarded_for, ",")
        |> Enum.map(&String.trim/1)
        |> List.first()
      else
        to_string(:inet_parse.ntoa(conn.remote_ip))
      end

    Logger.info("IP address is: #{ip_address}")

    render(conn, "index.html")
  end
end
