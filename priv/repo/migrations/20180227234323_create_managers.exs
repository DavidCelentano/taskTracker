defmodule Tasktracker.Repo.Migrations.CreateManagers do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :employee_id, references(:users, on_delete: :delete_all), null: false
      add :underling_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:managers, [:employee_id])
    create index(:managers, [:underling_id])
  end
end
