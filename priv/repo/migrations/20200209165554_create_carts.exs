defmodule CartApi.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :user_id, :id

      timestamps()
    end

  end
end
