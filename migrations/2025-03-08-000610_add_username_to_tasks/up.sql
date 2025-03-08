-- Your SQL goes here

-- 一時テーブルに既存データをコピー
CREATE TABLE tasks_backup (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  done BOOLEAN NOT NULL
);

INSERT INTO tasks_backup SELECT id, title, done FROM tasks;

-- 既存テーブルを削除
DROP TABLE tasks;

-- 新しいテーブルを作成
CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  done BOOLEAN NOT NULL DEFAULT FALSE,
  username TEXT NOT NULL,
  FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

-- データを戻す（全てのタスクをadminユーザーに割り当て）
INSERT INTO tasks (id, title, done, username)
SELECT id, title, done, 'admin' FROM tasks_backup;

-- バックアップテーブルを削除
DROP TABLE tasks_backup;
