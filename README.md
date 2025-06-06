# Vigil

## Installation

Clone into the following local directory `~/code/elixir` so that this readme
ens up in
`~/code/elixir/vigil`

Run `mix release`

Put the following in your `zshrc` or `bashrc`

```bash
# Automatically start vigil on terminal startup if not already running
if [[ $- == *i* ]]; then
  if ! pgrep -f "vigil/start.sh" > /dev/null 2>&1; then
    ~/code/elixir/vigil/start.sh &
  fi
fi
```
