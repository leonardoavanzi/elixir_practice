defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
    params = %{"filename" => "students.csv"}
    response =
      conn
       |> get(Routes.imc_path(conn, :index, params)) |> json_response(:bad_request)

      expected_response =  %{
        "Result" => %{
          "Gabul" => 35.15339663988313,
          "Jacas" => 33.29864724245577,
          "Junior" => 30.555555555555554,
          "Leonardo" => 22.22222222222222,
          "Ralf" => 42.15433445744892
        }
      }
      assert response == expected_response

    end


    test "invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "ostudents.csv"}
      response =
        conn
         |> get(Routes.imc_path(conn, :index, params)) |> json_response(:ok)

        expected_result = %{"result" => "Error while oopening the file"}
        assert response == expected_result

      end
  end
end
