defmodule Auctionsystem.Sales.Bid do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bids" do
    field :item_id, :integer
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(bid, attrs) do
    bid
    |> cast(attrs, [:item_id, :price])
    |> validate_required([:item_id, :price])
  end
end
