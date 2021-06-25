defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "valid id, return user", %{conn: conn} do
      params = %{email: "leonardo@teste.com", name: "Leonardo", password: "1234657"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
      {
        getUser(id: "#{user_id}"){

          name
          email
          }
        }
      """
      response = conn |> post("/api/graphql", %{query: query}) |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "leonardo@teste.com",

            "name" => "Leonardo"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
      mutation {
        createUser(input: {
          name: "leonardo avanzloloollool", email: "avanzi9999@email.com", password:"12345678"
        }){
          id
          name
        }
      }
      """
      response = conn |> post("/api/graphql", %{query: mutation}) |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "leonardo avanzloloollool"}}} = response

    end
  end

end
