defmodule Tasktracker.ProductivityTest do
  use Tasktracker.DataCase

  alias Tasktracker.Productivity

  describe "tasks" do
    alias Tasktracker.Productivity.Task

    @valid_attrs %{body: "some body", completed: true, duration: 42, title: "some title"}
    @update_attrs %{body: "some updated body", completed: false, duration: 43, title: "some updated title"}
    @invalid_attrs %{body: nil, completed: nil, duration: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Productivity.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Productivity.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Productivity.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Productivity.create_task(@valid_attrs)
      assert task.body == "some body"
      assert task.completed == true
      assert task.duration == 42
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productivity.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Productivity.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.body == "some updated body"
      assert task.completed == false
      assert task.duration == 43
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Productivity.update_task(task, @invalid_attrs)
      assert task == Productivity.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Productivity.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Productivity.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Productivity.change_task(task)
    end
  end
end
