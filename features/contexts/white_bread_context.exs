defmodule WhiteBreadContext do
  use WhiteBread.Context
  use Hound.Helpers

  alias Auctionsystem.{Repo, Sales.Auction, Sales.Bid}

  feature_starting_state fn  ->
    Application.ensure_all_started(:hound)
    %{}
  end
  scenario_starting_state fn _state ->
    Hound.start_session
    Ecto.Adapters.SQL.Sandbox.checkout(Exam.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Exam.Repo, {:shared, self()})
    %{}
  end
  scenario_finalize fn _status, _state ->
    Ecto.Adapters.SQL.Sandbox.checkin(Exam.Repo)
  end

  given_ ~r/^the following items available $/, fn state, %{table_data: table} ->
    table
    |> Enum.map(fn lot -> Auction.changeset(%Auction{}, lot) end)
    |> Enum.each(fn changeset -> Repo.insert!(changeset) end)
    {:ok, state}
  end

  and_ ~r/^I want to offer 62.00$ for Chicago Bullet Speed Skate (Size 7) $/,
  fn state, %{} ->
    {:ok, state |> Map.put()}
  end

  and_ ~r/^I open project web page$/, fn state ->
    navigate_to "/items"
    {:ok, state}
  end

  and_ ~r/^I select item which description is Chicago Bullet Speed Skate (Size 7) $/, fn state ->
    navigate_to "/items/8"
    {:ok, state}
  end

  and_ ~r/^I enter the 62.00$ into the field $/, fn state ->
    fill_field({:id, "bid"}, state[:bid])
    {:ok, state}
  end

  when_ ~r/^I submit the place bid button $/, fn state ->
    click({:id, "place_bid_button"})
    {:ok, state}
  end

  then_ ~r/^I should get the confrimation message $/, fn state ->
    assert visible_in_page? "your bid has been set"
    {:ok, state}
  end
end
