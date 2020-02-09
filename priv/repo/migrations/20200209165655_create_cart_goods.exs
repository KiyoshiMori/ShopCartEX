defmodule CartApi.Repo.Migrations.CreateCartGoods do
  use Ecto.Migration

  def change do
    create table(:cart_goods) do
      add :cart_id, references(:carts), primary_key: true
      add :good_id, references(:goods), primary_key: true
    end

    create(index(:cart_goods, [:cart_id]))
    create(index(:cart_goods, [:good_id]))
  end
end
