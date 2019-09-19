alias Auctionsystem.{Repo, Sales.Auction}
alias Ecto.Date

[%{description: "Roller Derby Bron Blade Skote (Size 7)", price: 29.00 , closing_date: "2016-01-29"},
 %{description: "Chicago Bullet Speed Skate (Size 7)", price: 59.00, closing_date: "2016-10-26"},
 %{description: "Riedell Dart Derby Skates (size 8)", price: 106.00, closing_date: "2016-01-30"},
 %{description: "Roller Derby Bron Blade Skote (Size 7)", price: 29.00 , closing_date: "2019-01-28"},
 %{description: "Chicago Bullet Speed Skate (Size 7)", price: 59.00, closing_date: "2019-01-25"},
 %{description: "Riedell Dart Derby Skates (size 8)", price: 106.00, closing_date: "2019-01-23"}]
|> Enum.each(fn item ->
      Repo.insert!(Auction.changeset(%Auction{},
        %{description: item.description, closing_date: Date.cast!(item.closing_date), price: item.price}))
      end)
