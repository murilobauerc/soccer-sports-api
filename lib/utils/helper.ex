defmodule Utils.Helper do
  def atomize_keys(map) do
    Enum.reduce(map, %{}, fn {k, v}, acc ->
      Map.put(acc, String.to_atom(k), v)
    end)
  end
end
