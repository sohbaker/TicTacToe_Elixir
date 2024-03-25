# TicTacToe
A TicTacToe application built using Elixir, that allows a user to play the game from 
the Command Line. The game can wither be played Human vs Human or Human vs Computer. 
Intended future behaviour is to allow a user to play the game from a Web Server. 

## Features
- [x] A human vs human game which runs on the Command Line  
- [x] A human vs computer game which runs on the Command Line  
- [] An HTTP client so that the game to be played on a locally hosted web server 

## Getting Started
Refer to [Installing Elixir](https://elixir-lang.org/install.html) for guidance on 
installing Elixir on your local machine  
Useful Resource: [Elixir Documentation](https://elixir-lang.org/docs.html)

## Running the Application
Run the command `mix escript.build` to build the executable. 

### Compiling the Application
Compile the application with the command `mix compile`. 

### CLI
Call the following depending on which type of game you'd like to load: 
- Human vs Human `./tictactoe --version=hh`
- Human vs Computer `./tictactoe --version=hc` 

## Testing
Use command `mix test` to run the test files.


You should see output similar to the following in your terminal: 
```
.........................
Finished in 0.5 seconds (0.05s async, 0.5s sync)
29 tests, 0 failures
```

----------------

## Documentation
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). 
Once published, the docs can
be found at [https://hexdocs.pm/tictactoe](https://hexdocs.pm/tictactoe).
