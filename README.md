# Rust Rocket TODOアプリ

ユーザー認証機能付きのシンプルなTODOリストアプリケーションです。RustのRocketフレームワークとSQLiteデータベースを使用しています。

## 機能

- ユーザー登録・ログイン認証
- ユーザーごとの個別TODOリスト管理
- タスクの追加・更新・削除
- タスクの完了状態の切り替え
- モバイルフレンドリーなUI

## 技術スタック

- **バックエンド**:
  - Rust 1.67+
  - Rocket 0.5 (Webフレームワーク)
  - Diesel 2.0 (ORM)
  - SQLite (データベース)
  - bcrypt (パスワードハッシュ化)

- **フロントエンド**:
  - HTML5
  - CSS3
  - JavaScript (Fetch API)

## 前提条件

- Rust と Cargo がインストールされていること
- SQLite がインストールされていること
- Diesel CLI がインストールされていること

## インストール手順

1. リポジトリをクローンします：

```bash
git clone https://github.com/yourusername/rust-todo-rocket.git
cd rust-todo-rocket
```

2. Diesel CLI をインストールします（未インストールの場合）：

```bash
cargo install diesel_cli --no-default-features --features sqlite
```

3. データベースをセットアップします：

```bash
echo DATABASE_URL=./todo.db > .env
diesel setup
diesel migration run
```

4. アプリケーションを起動します：

```bash
cargo run
```

5. ブラウザで以下のURLにアクセスします：

http://localhost:8000


## 使い方

1. 最初に「新規登録」からアカウントを作成します
2. 作成したアカウントでログインします
3. 「新しいタスク」に内容を入力し、「追加」ボタンでタスクを追加します
4. タスクのチェックボックスをクリックすると、完了/未完了を切り替えられます
5. 「削除」ボタンを押すと、タスクを削除できます
6. 別のユーザーでログインすると、ユーザーごとに独立したタスクリストが表示されます

## プロジェクト構造

```
rust-todo-rocket/
├── src/
│ ├── main.rs # メインアプリケーションコード
│ ├── models.rs # データモデル定義
│ └── schema.rs # Diesel自動生成スキーマ
├── static/
│ └── index.html # フロントエンドUI
├── migrations/ # データベースマイグレーションファイル
├── Cargo.toml # 依存関係定義
└── .env # 環境変数設定
```

## ライセンス

MIT

## 謝辞

このプロジェクトは、Rust、Rocket、Dieselの公式ドキュメントとコミュニティのサポートによって支えられています。
