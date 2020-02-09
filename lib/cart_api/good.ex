defmodule CartApi.Good do
  use Ecto.Schema
  import Ecto.Changeset

  alias CartApi.{Cart}

  schema "goods" do
    field :description, :string
    field :img, :string
    field :name, :string
    many_to_many(:carts, Cart, join_through: "cart_goods")

    timestamps()
  end

  @doc false
  def changeset(good, attrs) do
    good
    |> cast(attrs, [:name, :description, :img])
    |> validate_required([:name, :description, :img])
  end
end
