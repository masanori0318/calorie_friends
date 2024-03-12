# アプリケーション名 
calorie_friends

# アプリケーション概要  

# URL 
デプロイ済みのURLを記載。デプロイが済んでいない場合は、デプロイが完了次第記載すること。
# テスト用アカウント 
ログイン機能等を実装した場合は、ログインに必要な情報を記載。またBasic認証等を設けている場合は、そのID/Passも記載すること。
# 利用方法  
このアプリケーションの利用方法を記載。説明が長い場合は、箇条書きでリスト化すること。
# アプリケーションを作成した背景 

このアプリケーションを通じて、ダイエットや、食事制限などで食事に気をつけたいけどカロリーのことを忘れてしまう人や、カロリー計算が面倒な人、記録して日々の管理をしたい方に向けて作成しました。
# 洗い出した要件 
https://docs.google.com/spreadsheets/d/1lZB2L9MapGlK937o9HTbXPQ6GTVmk0vl/edit#gid=2003088070


# データベース設計  
[![Image from Gyazo](https://i.gyazo.com/0b95d90c2213f6f85a8b1ff950e86861.png)](https://gyazo.com/0b95d90c2213f6f85a8b1ff950e86861)
# 画面遷移図 

[![Image from Gyazo](https://i.gyazo.com/63840b52ca85fcd5b68934f4f55aa62e.png)](https://gyazo.com/63840b52ca85fcd5b68934f4f55aa62e)
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |

### Association

has_many :records

## records テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| breakfast   | string     | null: false                    |
| lunch       | string     | null: false                    |
| dinner      | string     | null: false                    |
| snack       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| breakfast_cal | integer    | null: false                    |
| lunch_cal     | integer    | null: false                    |
| dinner_cal    | integer    | null: false                    |
| snack_cal     | integer    | null: false                    |
| total_calorie | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
### Association

- belongs_to :user 
  has_many_attached :images


# 開発環境  
・Ruby
・Ruby on Rails
・JavaScript
・Visual Studio Code
・Git Hub

# ローカルでの動作方法  
以下のコマンドを順に実行。
% git clone https://github.com/masanori0318/calorie_friends

% cd calorie_friends
% bundle install
%
# 工夫したポイント  

制作背景としてオリジナルアプリを作成する際に自分や周りの人が日常的に使えて、生活に関わるものを作成しようと思い、食生活の見直しができるアプリを作ろうと思ったことがきっかけです。
使用技術はフロントエンドにHTML・CSS、JavaScriptを使用。またVisual Studio Code使用して効率的なコーディングと開発を行いました。
バックエンドはRubyとRuby on Railsを使用し、堅牢で拡張可能なバックエンドシステムを構築しました。
アジャイル開発:
開発プロセスにはアジャイル手法で、短いスプリントで機能を実装し、継続的なフィードバックを得ながら柔軟に対応しました。
Git Hubを使用して、タスクの追跡、優先順位付け、進捗管理を行いました。
# 改善点 
HTMLの見やすさ、機能追加など
# 制作時間  
2ヶ月
