defmodule CartApi.Good do
  use Ecto.Schema
  import Ecto.Changeset

  alias CartApi.{Cart, Good, Repo}

  schema "goods" do
    field :description, :string
    field :img, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(good, attrs) do
    good
    |> cast(attrs, [:name, :description, :img])
    |> validate_required([:name, :description, :img])
  end

  def create_good(good) do
    %Good{}
    |> cast(good, [:name])
    |> Repo.insert
  end
end
