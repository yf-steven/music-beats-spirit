# README

# 名称

**music beats spirit**

# 概要

ライブでの感動を共有する為、個人が書いたライブレポートを投稿できるサイトです。
ジャンルは不問、レポートにコメントすることによりファン同士の交遊を図ることもできます。
また、ライブ初心者や家族連れのファン向けにライブの特長を星評価し視覚化することでライブ参戦前の
参考情報を提供します。

# 制作背景

 個人で書くライブレポートを共有することで、ライブで得られる大きな感動をも共有できるようにしたいからです。
ライブレポートにすることで、ライブ開始前の期待感から演出やセットリストに対する考察、ライブ後の余韻まで
余すことなくライブで得た物を書き込むことができます。
 また、ライブに慣れていないライブ初心者や家族連れのファンはライブに行くこと自体に不安感を覚えます。
そこで、ライブの激しさ・家族連れへのオススメ度・ライブに行く前の予習必要度を視覚化し、少しでも
ライブ参戦へのハードルを下げたいと思いました。

# URL

[music beats spirit](https://music-beats-spirit.herokuapp.com/)

# 利用方法

- ユーザー登録を行い、投稿アイコンをクリックしレポート作成画面に遷移します。タイトル、本文を入力しレポートを投稿します。
  投稿されたレポートはトップページに一覧表示されます。投稿されたレポートをクリックすると詳細画面に遷移し、
- 投稿者以外のユーザーはコメントすることができます。
  レポート検索ボタンをクリックすると、検索画面に遷移します。検索条件を入力して検索実行ボタンをクリックすると、
  該当するレポートが表示されます。

# 実装予定の機能

- ライブ初心者や初めてのアーティストに行く人向けにライブの特長をライブレポートに星評価で追加します。
- アーティスト一覧機能、アーティスト詳細機能を追加します。アーティスト詳細画面には投稿された星評価の平均点や
  ユーザーの男女比を表示します。
- ライブレポートにコメント機能の他にいいね機能を実装します。

# テーブル設計

## usersテーブル

|   column  |   type  |         options        |
| --------- | ------- | ---------------------- |
|  nickname |  string | null:false unique:true |
|   email   |  string | null:false unique:true |
|  password |  string |       null:false       |
| introduce |   text  |       null:false       |
|  favorite |  string | ---------------------- |
|   sex_id  | integer |       null:false       |
|   age_id  | integer |       null:false       |

### association

- has_many :reports
- has_many :comments

## reportテーブル

|   column  |     type   |      options     |
| --------- | ---------- | ---------------- |
|   title   |   string   |    null:false    |
|    text   |    text    |    null:false    |
| recommend |   string   | ---------------- |
|    user   | references | foreign_key:true |

### association

- belongs_to :user
- has_many :comments

## commentsテーブル

| column |    type    |     options      |
| ------ | ---------- | ---------------- |
|  text  |    text    |    null:false    |
|  user  | references | foreign_key:true |
| report | references | foreign_key:true |

### association

- belongs_to :user
- belongs_to :report