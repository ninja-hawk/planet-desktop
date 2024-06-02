import Config

config :planet, Planet.Repo,
  username: "planet",
  password: "postgres",
  database: "planet_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

if Mix.target() == :ios do
  config :planet, Planet.Repo, hostname: "127.0.0.1"
end

if Mix.target() == :android do
  config :planet, Planet.Repo, hostname: "10.0.2.2"
end

config :planet, PlanetWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 0],
  live_view: [signing_salt: "nt9pr/6W"],
  secret_key_base: "cVZaz98CBZNGr4dk7XhVqYpW49We6OKdzORLS20peE0ZK8Qv3ex6uOLujx/mXS80",
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json"
