defmodule CartApi.Repo.Migrations.CreateGoods do
  use Ecto.Migration

  def change do
    create table(:goods) do
      add :name, :string
      add :description, :text
      add :img, :string

      timestamps()
    end

  end
end
