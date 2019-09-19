defmodule Auctionsystem.Repo.Migrations.CreateAuctions do
  use Ecto.Migration

  def change do
    create table(:auctions) do
      add :description, :string
      add :price, :float
      add :closing_date, :date

      timestamps()
    end

  end
end
