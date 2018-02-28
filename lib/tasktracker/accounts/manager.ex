defmodule Tasktracker.Accounts.Manager do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Accounts.Manager


  schema "managers" do
    belongs_to :employee, Tasktracker.Accounts.User
    belongs_to :underling, Tasktracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Manager{} = manager, attrs) do
    manager
    |> cast(attrs, [:employee_id, :underling_id])
    |> validate_required([:employee_id, :underling_id])
  end
end
