# phoenix-studies-guardian
[ueberauth/guardian](https://github.com/ueberauth/guardian) のテスト実装

https://github.com/hykw/phoenix-skeleton 記載の初期設定は終わっていることを前提とする。

## 初期設定

- guardian の設定
- plugとシリアライザを追加

## User テーブルを追加

※検証用なので、password カラムに生パスワードを保存する

```bash
$ mix phoenix.gen.model User users email:string password:string
$ mix ecto.migrate
```

## アカウントまわりの機能を追加（登録・ログイン・ログアウトの実装）

- router.ex
- register
- login
- logout

- --no-brunch を指定しているため、js を自分で生成・設置

```bash
cat deps/phoenix_html/priv/static/phoenix_html.js >> priv/static/js/app.js
```


## 権限チェック用のページを用意

権限は config/config.exs で下記を用意

```elixir
  permissions: %{
    user: [
      :read,
      :write,
    ],
    admin: [
      :admin_read,
      :admin_write,
    ]
  }
```

### ページ
- /users/
  - user/admin権限でログインしてればOK
- /users/read
  - userのread, admin権限でOK
- /users/write
  - userのwrite, admin権限でOK

- /admin/
  - admin権限でログインしてればOK
- /admins/read
  - adminのadmin_read権限でOK
- /admins/write
  - adminのadmin_write権限でOK


### アカウントの権限

ログイン時の users.id によって、権限を付与する。各IDの権限は下記

- ID=1: admin(admin_read, admin_write)
- ID=2: admin(admin_write)
- ID=3: admin(admin_read)
- ID=4: user(read, write)
- ID=5: user(write)
- ID=6: user(read)

