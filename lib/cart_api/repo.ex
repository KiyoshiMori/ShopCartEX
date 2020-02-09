defmodule CartApi.Repo do
  use Ecto.Repo,
    otp_app: :cart_api,
    adapter: Ecto.Adapters.Postgres
end
