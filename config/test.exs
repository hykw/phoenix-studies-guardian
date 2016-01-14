use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :guardian_study, GuardianStudy.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :guardian_study, GuardianStudy.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "testuser",
  password: "testpass",
  database: "phoenix_studies_guardian",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
