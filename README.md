# phoenix-studies-guardian
ueberauth/guardian のテスト実装（プロジェクトを新規作成する時の手順も兼ねる）

# 前準備
## MySQLの準備
```
$ mysql -u root  -h127.0.0.1 -p

create database phoenix_studies_guardian;
grant all privileges on phoenix_studies_guardian.* TO "testuser"@"localhost" identified by "testpass";
flush privileges;
```

# Phoenix の初期設定

```bash
$ mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.1.2/phoenix_new-1.1.2.ez
$ mix phoenix.new guardian_study --no-brunch --database mysql
```

## ファイルの初期設定とテスト確認
- .gitignore
- config/dev.exs
- config/test.exs

```bash
$ mix test
```

## エラーメッセージの日本語化

- localeファイル(https://github.com/hykw/phoenix-locale_ja)をセット

```bash
$ mkdir -p priv/gettext/ja/LC_MESSAGES
$ wget https://raw.githubusercontent.com/hykw/phoenix-locale_ja/master/ja/LC_MESSAGES/errors.po
$ mv errors.po priv/gettext/ja/LC_MESSAGES/
```

- config/config.exs にロケールセット

## ログのファイル出力

- .gitignore
- config/config.exs
- config/dev.exs
- mix.exs
- lib/guardian_study/endpoint.ex
- web/plugs/logger.ex

```bash
$ mix deps.get
```

