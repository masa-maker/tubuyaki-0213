# README

# アプリケーション名
### Tubuyaki

# アプリケーション概要
「つぶやき」をシェアするアプリです。

# 開発目的
Javascriptを用いての機能実装を身に着ける為。<br>
Formオブジェクトを用いて「Tag機能」の編集、更新の実装の練習の為。

# 機能一覧
- 投稿機能
- 検索機能（Ajax）
- タグ付機能(Formオブジェクト)
- チャットルーム機能(Action Cable)
- 画像プレビュー機能

# アプリケーションURL
https://tubuyaki-0213.herokuapp.com/

## Basic認証
USER  tubuyaki<br>
Pass  4649464

# 利用方法
- Basic認証を使用してトップページへ遷移します。
- 「Tubuyaki」にカーソルを合わせてクリックし、つぶやき一覧へ遷移します。
- タグとつぶやきを投稿することが出来ます。
- タグの更新、削除を行うことが出来ます。
- 「Talk Room」へ遷移しチャットを行うことが出来ます。



# 挙動GIF

### Javascriptを用いて画像の切り替え

![top](https://user-images.githubusercontent.com/76035698/107866377-9866b000-6eb3-11eb-87e0-2949d10e72f1.gif)

### Javascriptを用いて「逐次検索機能」実装

![tags](https://user-images.githubusercontent.com/76035698/107866394-bf24e680-6eb3-11eb-9a1d-d8792fe603fc.gif)

### Javascriptの「action cable」を用いてチャット機能実装

![actioncable](https://user-images.githubusercontent.com/76035698/107866395-c0eeaa00-6eb3-11eb-9c98-f876ce52e833.gif)

### Javascriptを用いて「画像プレビュー機能」

![prev](https://user-images.githubusercontent.com/76035698/108831335-50f7c680-760d-11eb-80f8-654d584e7497.gif)

# ER図

![ER](https://user-images.githubusercontent.com/76035698/107866535-4f176000-6eb5-11eb-9eba-43556d05d2e2.png)

# ローカルでの動作環境

Rails 6.0.3.4<br>
Ruby 2.6.5<br>
Gem 3.0.3<br>
MySql 5.6.50<br>
Yarn 1.22.10


% git https://github.com/masa-maker/tubuyaki-0213.git<br>
% cd tubuyaki-0213<br>
% bundle install<br>
% yarn install<br>
% rails db:create<br>
% rails db:migrate


# テーブル設計

## lists テーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| info   | text       | null: false                    |

### Association

- has_many :tag_list_relations, dependent: :destroy
- has_many :tags, through: :tag_list_relations


## tags テーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| name   | string     | null: false                    |

### Association

- has_many :tag_list_relations
- has_many :lists, through: :tag_list_relations


## tag_list_relation テーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| list   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :list
- belongs_to :tag

## messages テーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| text   | string     | null: false                    |