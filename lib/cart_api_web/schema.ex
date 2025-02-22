defmodule CartApi.Schema do
  use Absinthe.Schema

  import_types CartApi.Schema.Types

  alias CartApi.Resolvers.{Main}

  query do
    field :test, :user do
      resolve &test/3
    end

    field :get_carts, list_of(:cart) do
      resolve &Main.get_carts/3
    end

    field :get_cart, :cart do
      arg :cart_id, :integer
      resolve &Main.get_cart/3
    end

    field :get_goods, list_of(:good) do
      resolve &Main.get_goods/3
    end
  end

  mutation do
    field :add_to_cart, :cart do
      arg :input, :cart_input
      resolve &Main.add_to_cart/3
    end

    field :create_good, :good do
      arg :input, :good_input
      resolve &Main.create_good/3
    end
  end

  def test(_, _, _) do
    {:ok, %{id: "test"}}
  end
end