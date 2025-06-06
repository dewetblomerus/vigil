# Vigil

## Installation

Put the following in your `zshrc` or `bashrc`

```bash
# Automatically start vigil on terminal startup if not already running
if [[ $- == *i* ]]; then
  if ! pgrep -f "vigil/start.sh" > /dev/null 2>&1; then
    ~/code/elixir/vigil/start.sh &
  fi
fi
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/vigil>.
