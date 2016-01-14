# phoenix-studies-guardian
ueberauth/guardian のテスト実装

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


