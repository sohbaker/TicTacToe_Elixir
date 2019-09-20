defmodule CLI.EntryPoint do
  def main(args \\ []) do
    args |> parse_args |> process |> start
  end

  defp process([]) do
    Display.print_to_screen("No arguments given")
  end

  defp process(options) do
    case options[:version] do
      "hh" -> GameLoader.human_human()
      "hc" -> GameLoader.human_computer()
      _ -> Display.print_to_screen("Invalid load argument")
    end
  end

  defp start(game) do
    Display.print_to_screen(Display.greeting())
    CLI.Interact.play(game)
  end

  defp parse_args(args) do
    {options, _, _} =
      OptionParser.parse(args,
        switches: [version: :string]
      )

    options
  end
end
