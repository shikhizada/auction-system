defmodule AuctionsystemWeb.Router do
  use AuctionsystemWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuctionsystemWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/items", AuctionController, :items
    get "/items/:id", AuctionController, :details
  end

  # Other scopes may use custom stacks.
   scope "/api", AuctionsystemWeb do
     pipe_through :api
     post "/available_items", AuctionController, :available_items
     post "/selected_item", AuctionController, :selected_item
     post "/place_bid", AuctionController, :place_bid
   end
end
