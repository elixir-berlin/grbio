use Mix.Config

config :grbio, Grbio.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "grbio.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :info

config :grbio, Grbio.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :grbio, Grbio.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20
