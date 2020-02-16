defmodule CartApi.Schema.Types do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
  end

  object :good do
    field :id, :id
    field :name, :string
  end

  object :cart do
    field :id, :id
    field :goods, list_of(:good)
  end

  input_object :good_input do
    field :name, :string
  end

  input_object :cart_input do
    field :good_id, :integer
    field :cart_id, :id
  end
end