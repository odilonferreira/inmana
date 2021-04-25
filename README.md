# Inmana

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

### Some tools used

Mix - CLI of Elixir
Credo - Linter for Elixir
Ecto - Interact with database
Jason - Encode elixir struct to json

### Common commands

- mix ecto.create
- mix phx.server
- mix deps.get
- mix test
- mix compile
- mix phx.routes (show all rotes of the application)

- iex (interative elixir)
- iex -S mix

- h [something] (see documentation of someting)
  - h Inmana.Repo.insert/2

- mix credo

- mix ecto.gen.migration create_restaurants_table
- mix ecto.gen.migration create_supplies_table
- mix ecto.migrate

- creating alias
  - alias Inmana.Restaurant (allow use only Restaurant)
  - alias Inmana.Repo (allow use only Repo)
  - alias Inmana.Restaurants.Create (allow use only Create)

- changeset = Restaurant.changeset(%{name: "Siri Cascudo", email: "siri@fenda.com"})
- %{name: "banana"} |> Restaurant.changeset() |> Repo.insert() (Struct contains error about email cant be blank)

- params = %{name: "Balde de lixo", email: "balde@fenda.com"}
- Create.call(params)

### Learned concepts 

- Modules
- Immutability
- Pattern matching

### Design Patterns studied

- Railway oriented programming: ensure every function or method should and must always return a success or a failure
- Facade: give a more simple interface for a bigger code body