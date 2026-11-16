## Environment

- This host runs NixOS.
- Do not use apt, global pip/npm installs, or `curl | sh`.
- If a tool is missing, run it with `nix shell nixpkgs#<pkg> -c <cmd>`.
- Use only `nixpkgs#`. Never run third-party flakes (`github:...`) or `nix run` on them without asking.
- If the project has a flake.nix, use `nix develop` or `direnv`.

## Self-Documenting Guidelines

- The primary goal is to write code that is understandable without additional explanation.
- Comments should only be used in rare cases to explain why something is done in a particular way (e.g., workarounds for a specific bug).
- Avoid using comments (#) or docstrings (""", ''') to explain what the code does.
