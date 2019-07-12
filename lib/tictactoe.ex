defmodule TicTacToe.CLI do
  def main(args \\ []) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts("No arguments given")
  end

  def process(options) do
    case options[:version] do
      "hh" -> GameLoader.human_human()
      "hc" -> GameLoader.human_computer()
      _ -> IO.puts("Invalid load argument")
    end
  end

  defp parse_args(args) do
    {options, _, _} =
      OptionParser.parse(args,
        switches: [version: :string]
      )

    options
  end
end
