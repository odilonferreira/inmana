defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  # Constant for primary keys
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Constant for required params of Supply module that Jason will encode for json
  @required_params [:description, :expiration_date, :responsible, :restaurant_id]

  # Jason module that makes the only @required_params more id of Supply will encode
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  # Special structure that will validate data and show errors
  # Other validation in https://hexdocs.pm/ecto/Ecto.html
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
  end
end
