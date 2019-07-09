defmodule TicTacToe.CLI do
  def main(args \\ []) do
    args |> parse_args |> process
  end

  def process([]) do 
    IO.puts "No arguments given"
  end

  def process(options) do 
    if options[:version] == "hh" do
      GameLoader.start_game()
    else 
      IO.puts "Invalid load argument"
    end
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [version: :string]
    )
    options
  end
end
