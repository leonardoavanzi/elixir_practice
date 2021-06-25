defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Gabul" => 35.15339663988313,
           "Jacas" => 33.29864724245577,
           "Junior" => 30.555555555555554,
           "Leonardo" => 22.22222222222222,
           "Ralf" => 42.15433445744892
         }}

      assert response == expected_response
    end

    test "when the file doesnt exists" do
      params = %{"filename" => "studentsrous.csv"}

      response = IMC.calculate(params)

      expected_response =
      {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
