defmodule WabanexWeb.IMCController do
    use WabanexWeb, :controller

    alias Wabanex.IMC

    def index(conn, params) do
        # IO.inspect(conn)
        # IO.inspect(params)
        params
        |> IMC.calculate()
        |> handle_response(conn)
    end

    defp handle_response({:error, rs}, conn), do: render_response(conn, rs, :ok)

    defp handle_response({:ok, rs}, conn), do: render_response(conn, rs, :bad_request)

    defp render_response(conn, rs, stmt) do
        conn
        |> put_status(stmt)
        |> json(%{Result: rs})
    end
end
