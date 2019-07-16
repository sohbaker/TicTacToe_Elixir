# TicTacToe
A TicTacToe application built in Elixir, which allows a user to play the game from 
the Command Line or a Web Server.

## Getting Started
Refer to [Installing Elixir](https://elixir-lang.org/install.html) for guidance on 
installing Elixir on your local machine  
Useful Resource:- [Elixir Documentation](https://elixir-lang.org/docs.html)

## Features
- [x] A human vs human game which runs on the Command Line  
- [x] A human vs computer game which runs on the Command Line  
- [] An HTTP client so that the game to be played on a locally hosted web server  

## Running the Application
Once cloned, run the command `mix escript.build` to build the executable  
Then call `./tictactoe --version=hh` to load a Human vs Human game  
Or, call `./tictactoe --version=hc` to load a Human vs Computer game  

## Testing
Use command `mix test` to run the test files.

----------------
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/tictactoe](https://hexdocs.pm/tictactoe).
