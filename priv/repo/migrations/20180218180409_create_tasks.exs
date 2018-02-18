defmodule Tasktracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :body, :text
      add :completed, :boolean, default: false, null: false
      add :duration, :integer
      add :author_id, references(:users, on_delete: :nothing)
      add :asignee_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:author_id])
    create index(:tasks, [:asignee_id])
  end
end
