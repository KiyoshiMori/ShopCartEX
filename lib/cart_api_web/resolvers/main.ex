defmodule CartApi.Resolvers.Main do
  def get_carts(_, _, _) do
    {:ok, CartApi.Cart.get_carts()}
  end

  def get_cart(_, %{cart_id: id}, _) do
    {:ok, CartApi.Cart.get_cart(id)}
  end

  def add_to_cart(_, %{input: %{cart_id: id, good_id: good_id}}, _) do
    case CartApi.Cart.add_to_cart(id, good_id) do
      {:error, err} -> {:error, err}
      {:ok, res} -> {:ok, res}
      nil -> {:error, "error"}
    end
  end

  def create_good(_, %{input: good}, _) do
    case CartApi.Good.create_good(good) do
      {:error, err} -> {:error, err}
      {:ok, res} -> {:ok, res}
      nil -> {:error, "error"}
    end
  end

  def get_goods(_, _, _) do
    {:ok, CartApi.Good.get_goods()}
  end
end