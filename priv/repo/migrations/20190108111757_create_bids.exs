defmodule Auctionsystem.Repo.Migrations.CreateBids do
  use Ecto.Migration

  def change do
    create table(:bids) do
      add :item_id, :integer
      add :price, :float

      timestamps()
    end

  end
end
