defmodule CartApi.Cart do
  use Ecto.Schema
  import Ecto.Changeset
  alias CartApi.{Good, Cart, Repo, CartGoods}

  schema "carts" do
    field :user_id, :integer
    many_to_many(:goods, Good, join_through: "cart_goods")

    timestamps()
  end

  @doc false
  def changeset(carts, attrs) do
    carts
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
  end

  def get_carts() do
    Repo.all(Cart)
    |> Repo.preload(:goods)
  end

  def add_to_cart(cart_id, goods) do
    cart = Repo.get(Cart, cart_id)
    |> Repo.preload(:goods)

    new_goods = Enum.map(goods, fn x -> struct(Good, x) end)

    updated = cart.goods ++ new_goods

    res = cart
    |> cast(%{}, [])
    |> put_assoc(:goods, updated)
    |> Repo.update
  end
end
