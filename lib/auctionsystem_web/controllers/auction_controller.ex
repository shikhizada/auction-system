defmodule AuctionsystemWeb.AuctionController do
  use AuctionsystemWeb, :controller
  alias Auctionsystem.Repo
  alias Auctionsystem.Sales.Auction
  alias Auctionsystem.Sales.Bid

  import Ecto.Query

  def items(conn, _params) do
    changeset = Auction.changeset(%Auction{})
    render(conn, "items.html", changeset: changeset)
  end

  def details(conn, %{"id" => id}) do
    auction = Repo.get!(Auction, id)
    render conn, "details.html", auction: auction
  end

  def available_items(conn, params) do
    items = from(
      from p in Auction,
      where: p.closing_date > ^%{__struct__: Ecto.Date, day: Date.utc_today.day, month: Date.utc_today.month, year: Date.utc_today.year}
    ) |> Repo.all([])
    items = items |> Enum.map(fn item -> %{
              id: item.id,
              description: item.description,
              price: item.price,
              closing_date: item.closing_date
            } end)
    conn
      |> put_status(200)
      |> json(%{items: items})
  end

  def selected_item(conn, %{"id" => id}) do
    item = Repo.get(Auction, id)
    conn
      |> put_status(200)
      |> json(%{id: item.id, description: item.description, price: item.price, closing_date: item.closing_date})
  end

  def place_bid(conn, %{"id" => id, "new_price" => new_price}) do
    item = Repo.get(Auction, id)
    if Date.diff(item.closing_date, Date.utc_today) < 0 do
      conn
      |> put_status(202)
      |> json(%{message: "Date of the auction has been expired"})
    else
      if item.price < new_price do
        Repo.insert(Bid.changeset(%Bid{}, %{item_id: id, price: new_price}))
        Repo.update(Auction.changeset(item, %{price: new_price}))
        conn
          |> put_status(200)
          |> json(%{message: "your bid has been set"})
      else
        conn
          |> put_status(201)
          |> json(%{message: "Error. Your must be greater than current price"})
      end
    end
  end
end
