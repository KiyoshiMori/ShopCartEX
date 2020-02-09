defmodule CartApi.Resolvers.Main do
  def get_carts(_, _, _) do
    {:ok, CartApi.Cart.get_carts()}
  end

  def add_to_cart(_, %{input: %{cart_id: id, goods: goods}}, _) do
    case CartApi.Cart.add_to_cart(id, goods) do
      {:ok, res} ->
        IO.inspect(res)
        {:ok, res}
      nil -> {:error, "error"}
    end
  end
end