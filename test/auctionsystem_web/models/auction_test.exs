defmodule AuctionsystemWeb.AuctionTest do
  use ExUnit.Case

  alias Auctionsystem.Sales
  alias Auctionsystem.Sales.Auction

  @valid_attrs %{description: "Chicago Bullet Speed Skate (Size 7)", price: 60.00, closing_date: "2019-01-25"}
  @invalid_attrs %{description: nil, price: nil, closing_date: nil}

  test "changeset with valid attributes" do
    changeset = Lot.changeset(%Lot{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Lot.changeset(%Lot{}, @invalid_attrs)
    refute changeset.valid?
  end
end
