poke
---

A CLI for interacting with the Reserve Dollar smart contract.

This is designed for testing purposes. The goal is to make it easier to run small experiments
on the Reserve Dollar from the command line, without needing to write any code.

This is not the code we intend to use for deployment of the production copy of the Reserve
Dollar, nor for ongoing ops on the production Reserve Dollar. That code will use hardware
wallets and a more methodical confirmation process.

The CLI includes access to all of the public functions on the Reserve Dollar.

The CLI is written assuming that it is being run against a local Ethereum node, available
on http://localhost:8545, with the same-prefunded accounts as the 0xorg/devnet docker image.
To run the 0xorg/devnet docker image, use the command:

    docker run -it --rm -p 8545:8501 0xorg/devnet

To deploy a new copy of the Reserve Dollar locally, run:

    $(poke deploy)

Running this command inside `$(...)` will cause your shell to execute the output of the
command, which will set the appropriate environment variable for your next calls to `poke`
to run against the contract you just deployed.

To see the owner of the contract you just deployed, run:

    poke owner

This should show `0x5409ED021D9299bf6814279A6A1411A7e866A631`, the 0th pre-funded account
in the 0xorg/devnet image. You can check that with `poke address`:

    poke address @0

Anywhere you need to supply an address or a private key to the poke tool, you can use
the special strings `@0` - `@9` to get the corresponding address or key from the ten
pre-funded accounts in the 0xorg/devnet image.

For paid mutator calls, `poke` will default to using account `@0`. To override this default
per-command, you can use the `-F` (aka `--from`) flag, like so:

	poke --from @1 transfer @2 200.5

You can also switch the default for the remainder of the current terminal session with
`poke account`:

	$(poke account @3)

## Why "poke"?

`poke` lets you "poke" at the Reserve Dollar contract to investigate how it works.

`p`-`o`-`k`-`e` are also the letters you get if you type our token's ticker, "R-S-V-D",
on a Dvorak keyboard.