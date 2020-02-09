defmodule CartApi.CartGoods do
  use Ecto.Schema
  import Ecto.Changeset
  alias CartApi.{Good, Cart, Repo}

  schema "cart_goods" do
    field :cart_id, :id
    field :good_id, :id
    timestamps()
  end

  @doc false
  def changeset(carts_goods, attrs) do
  carts_goods
  |> cast(attrs, [:cart_id, :good_id])
  |> validate_required([:cart_id, :good_id])
  end
end
