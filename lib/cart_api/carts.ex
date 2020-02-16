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

  def get_cart(cart_id) do
    Repo.get(Cart, cart_id)
    |> Repo.preload(:goods)
  end

  def add_to_cart(cart_id, good_id) do
    cart = Repo.get(Cart, cart_id)
    |> Repo.preload(:goods)
    case(cart) do
      nil -> {:error, "cart not exist"}
      _ ->
        is_exist = Enum.any?(cart.goods, fn good ->
          good_id == good.id
        end)

        case(is_exist) do
          true -> {:error, "good already at cart"}
          false ->
            case(Repo.get(Good, good_id)) do
              nil -> {:error, "good not found"}
              found ->
                updated = [found | cart.goods]

                cart
                |> cast(%{}, [])
                |> put_assoc(:goods, updated)
                |> Repo.update
            end
        end
    end
  end
end
