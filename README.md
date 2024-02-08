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
# 実装した機能についての画像やGIFおよびその説明※ 
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記載。画像はGyazoで、GIFはGyazoGIFで撮影すること。
# 実装予定の機能 
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記載。
# データベース設計  
[![Image from Gyazo](https://i.gyazo.com/fd299f3e2c87d4a25c323953c0dd1995.png)](https://gyazo.com/fd299f3e2c87d4a25c323953c0dd1995)

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

- has_many :images
- has_many :meals
- has_many :calories

## images テーブル

| Column          | Type       | Options     |
| ------          | ------     | ----------- |
| breakfast_img   | string     | null: false |
| lunch_img       | string     | null: false |
| dinner_img      | string     | null: false |
| snack_img       | string     | null: false|
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :meals
- belongs_to :calories

## meals テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| breakfast   | string     | null: false                    |
| lunch       | string     | null: false                    |
| dinner      | string     | null: false                    |
| snack       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :images
- belongs_to :calories

## calories テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| breakfast_cal | integer    | null: false                    |
| lunch_cal     | integer    | null: false                    |
| dinner_cal    | integer    | null: false                    |
| snack_cal     | integer    | null: false                    |
| total_calorie | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
  
### Association

- belongs_to :images
- belongs_to :meals



# 開発環境  
使用した言語・サービスを記載。
・Ruby
・Ruby on Rails
・JavaScript
・Visual Studio Code
・Git Hub

# ローカルでの動作方法  
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。
# 工夫したポイント  
制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄を記載。
# 改善点 
より改善するとしたらどこか、それはどのようにしてやるのか。
# 制作時間  
アプリケーションを制作するのにかけた時間。
