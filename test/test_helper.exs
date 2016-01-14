ExUnit.start

Mix.Task.run "ecto.create", ~w(-r GuardianStudy.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r GuardianStudy.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(GuardianStudy.Repo)

