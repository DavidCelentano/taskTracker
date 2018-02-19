defmodule Tasktracker.Productivity.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Productivity.Task


  schema "tasks" do
    field :body, :string
    field :completed, :boolean, default: false
    field :duration, :integer
    field :title, :string
    belongs_to :author, Tasktracker.Accounts.User
    belongs_to :asignee, Tasktracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :completed, :duration, :author_id, :asignee_id])
    |> validate_required([:title, :body, :completed, :author_id])
  end
end
