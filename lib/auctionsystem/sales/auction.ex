defmodule Auctionsystem.Sales.Auction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "auctions" do
    field :closing_date, :date
    field :description, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(auction, attrs \\ %{}) do
    auction
    |> cast(attrs, [:description, :price, :closing_date])
    |> validate_required([:description, :price, :closing_date])
  end
end
