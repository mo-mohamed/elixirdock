defmodule Elixirdock.Repo do
  use Ecto.Repo,
    otp_app: :elixirdock,
    adapter: Ecto.Adapters.Postgres
end
