# OpenExchangeRates

This Elixir library uses the [openexchangerates.org](https://openexchangerates.org) API to retieve the latest exchange rates.

At initialization of the library, it will use the latest exchange rates from a cache file. After initialization it will immediately try to get the latest exchange rates from openexchangerates.org. If this fails it will retry to get a new update every minute.

After a successful update, it will check every minute if the cache needs to be updated and fetches the new rates from openexchangerates.org. You can configure the cache time, which by default is 24 hours. Please take in account that every check will be taking credits from your API usage.

To be able to use this library you will need an API token from openexchangerates.org which you can get [here](https://openexchangerates.org/signup).

## Example usage
This library gives you the following functions :

- List available currencies
```elixir
OpenExchangeRates.available_currencies |> Enum.take(10)
["AWG", "NAD", "INR", "LAK", "BOB", "MOP", "QAR", "SDG", "TMT", "BRL"]
```

- Get the exchange rate for USD to an other currency
```elixir
OpenExchangeRates.rate_for_currency(:EUR)
{:ok, 0.902}
```

- Convert any currency to an other
```elixir
OpenExchangeRates.convert(100.00, :EUR, :GBP)
{:ok, 84.81186252771619}
```

- Convert cents in any currency to an other
```elixir
OpenExchangeRates.convert_cents(100, :GBP, :AUD)
{:ok, 172}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `open_exchange_rates` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:open_exchange_rates, "~> 0.1.0"}]
    end
    ```

  2. Ensure `open_exchange_rates` is started before your application:

    ```elixir
    def application do
      [applications: [:open_exchange_rates]]
    end
    ```

## Configuration

Please add the following config to your config.exs
```elixir
config :open_exchange_rates,
  app_id: "MY API KEY",
  cache_time_in_minutes: 1440 #24 hours
```


## Testing the library
Before you run the tests, please make sure to set the OER_APP_ID environment to you app_id key.

