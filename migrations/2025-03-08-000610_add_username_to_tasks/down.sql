-- This file should undo anything in `up.sql`

-- 一時テーブルに既存データをコピー
CREATE TABLE tasks_backup (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  done BOOLEAN NOT NULL
);

INSERT INTO tasks_backup SELECT id, title, done FROM tasks;

-- 既存テーブルを削除
DROP TABLE tasks;

-- 元のテーブルを再作成
CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  done BOOLEAN NOT NULL DEFAULT FALSE
);

-- データを戻す
INSERT INTO tasks (id, title, done)
SELECT id, title, done FROM tasks_backup;

-- バックアップテーブルを削除
DROP TABLE tasks_backup;
