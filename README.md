# アプリケーション名：LttS

## 1.アプリケーション概要
***
名称は私が学生時代に好きな曲だった、「LISTEN TO THE STEREO!!」の頭文字を取ったもの。<br>
イヤホンやヘッドホン、スピーカーといったオーディオ製品のレビューをユーザーが投稿、第三者に公開し、情報交換を行うことを主な目的としたアプリケーション。<br>
実装済みの機能は大きく分けて以下の6つ。
* ユーザー新規登録機能、ログイン・ログアウト機能、登録したユーザー情報の編集機能
* レビューを投稿する機能、また投稿した本人のみレビューの編集、削除が可能な機能
* 投稿されたレビューに対しコメントができる機能、またそれを削除する機能
* 他者が投稿したレビューに対し高評価を付ける機能、またそれを削除する機能
* 気に入ったレビューをブックマークに追加する機能、またそれを削除する機能
* ユーザー毎のマイページを表示する機能

[LttSへのリンク](https://ltts-8922.herokuapp.com/)<br>
[LttSの要件定義へのリンク](https://docs.google.com/spreadsheets/d/1kJxqaOSbNfR5HjCfHeNNLHC61-jA-RpKVq3RGG4QlLg/edit#gid=982722306)

テスト用アカウント1<br>
Email: test<span>@a.com</span><br>
Pass: 111aaa

テスト用アカウント2<br>
Email: test<span>@b.com</span><br>
Pass: 222bbb

### 今後実装予定の機能
* カテゴリ別検索機能
* ログイン画面、レビュー投稿画面をモーダルウィンドウで表示する機能
* ブックマーク機能等の一部機能に非同期通信を適用
* ポートフォリオサイト、クレジット等の追加

### 2022/7/21〜取り組んでいること
* 転職活動
* 関心のあるPythonの動画学習
* 基本情報技術者試験の学習
* アルバイト
* ジム通い

#### 備考
* AWSの連携準備中のため画像が表示されない可能性有り。

## 2.アプリケーションを作成した背景
***
学生時代から邦楽やゲームミュージック等の音楽鑑賞が趣味で、イヤホンやヘッドホンを何度も買い替えた経験があり、その中でどの製品を買えば良いのか迷うことが多々あった。そのため、インターネット上でレビューを投稿し、他の人の参考になるサイトがあると嬉しいと考えアプリケーションの開発に取り組んだ。

## 3.データベース設計
***
[![Image from Gyazo](https://i.gyazo.com/50d8f74e607cd4998b68945f851462c1.png)](https://gyazo.com/50d8f74e607cd4998b68945f851462c1)
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|
|birthday|date|null: false|
|profile_text|text||

### Association
* has_many :reviews
* has_many :goods

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|review_text|text|null: false|
|price_range_id|integer|null: false|
|category_id|integer|null: false|
|evaluation_id|integer|null:false|
|user|references|null: false, foreign key: true|

### Association
* has_many :comments
* has_many :goods
* belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment_text|text|null:false|
|user|references|null: false, foreign key: true|
|review|references|null: false, foreign key: true|

### Association
* belongs_to :user
* belongs_to :review

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign key: true|
|review|references|null: false, foreign key: true|

### Association
* belongs_to :user
* belongs_to :review

### bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign key: true|
|review|references|null: false, foreign key: true|

### Association
* belongs_to :user
* belongs_to :review

## 4.画面遷移図
***
[![Image from Gyazo](https://i.gyazo.com/9f97aa23731b3aba6326ef7644949eeb.png)](https://gyazo.com/9f97aa23731b3aba6326ef7644949eeb)
* ヘッダーにはレビュー一覧表示画面、新規登録画面、ログイン画面、レビュー新規投稿画面、ログアウト画面へのパスを配置し、常に画面上部に表示させる。

## 5.開発環境
***
* フロントエンド
* バックエンド
* インフラ
* テスト
* テキストエディタ
* タスク管理

## 6.ローカルでの動作方法
***
以下のコマンドを順に実行<br>
% git clone https<span>://github.com/Fuzi8922/ltts-8922</span><br>
% cd ltts-8922<br>
% bundle install<br>
% yarn install

## 7.工夫した点
***
基本的なレビュー投稿サイトに必要な機能のほか、コメント機能やブックマーク機能などのユーザビリティを意識した機能を実装してみた。<br>
また、色調を自分好みの寒色系に統一し、デザインが良くなるようコーディングした。

