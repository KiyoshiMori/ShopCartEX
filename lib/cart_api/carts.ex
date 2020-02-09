defmodule CartApi.Cart do
  use Ecto.Schema
  import Ecto.Changeset
  alias CartApi.{Good, Cart, Repo, CartGoods}

  schema "carts" do
    field :user_id, :string
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
    res = %Cart{}
    |> cast(%{id: cart_id}, [:id])
    |> put_assoc(:goods, goods)

    Repo.insert(res)
  end
end
