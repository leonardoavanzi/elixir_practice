defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Leonardo", email: "leonardo@rous.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{valid?: true, changes: %{name: "Leonardo", email: "leonardo@rous.com", password: "123456"},
      errors: []
      } = response
    end

    test "when there are invalid, returns a invalid changeset" do
      params = %{name: "", email: "leonardo@rous.com", password: "126"}

      response = User.changeset(params)

      expected_response = %{name: ["can't be blank"], password: ["should be at least 6 character(s)"]}

      assert errors_on(response) == expected_response

    end

  end

end
