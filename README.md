# README

# 名称

**music beats spirit**

# 概要

ライブでの感動を共有する為、個人が書いたライブレポートを投稿できるサイトです。
ジャンルは不問、レポートにコメントすることによりファン同士の交遊を図ることもできます。
また、ライブ初心者や家族連れのファン向けにライブの特長を星評価し視覚化することでライブ参戦前の参考情報を提供します。

# 制作背景

個人で書くライブレポートを共有することで、ライブで得られる大きな感動をも共有できるようにしたいからです。
ライブレポートにすることで、ライブ開始前の期待感から演出やセットリストに対する考察、ライブ後の余韻まで余すことなくライブで得た物を書き込むことができます。
また、ライブに慣れていないライブ初心者や家族連れのファンはライブに行くこと自体に不安感を覚えます。そこで、ライブの激しさ・家族連れへのオススメ度・ライブに行く前の予習必要度を視覚化し、少しでもライブ参戦へのハードルを下げたいと思いました。

# URL

[music beats spirit](https://music-beats-spirit.herokuapp.com/)

# 利用方法

- ユーザー登録を行い、投稿アイコンをクリックしレポート作成画面に 遷移します。タイトル、本文、オススメポイントを記入します。星評価でライブの激しさ、女性や家族連れの方へのオススメ度、ライブの予習必要度を星0〜星5で選択し、レポートを投稿します。
- 投稿されたレポートはトップページに一覧表示されます。一覧表示では投稿されたレポートのタイトルと投稿者の名前のみ表示されますが、レポートのタイトルや投稿者の部分をクリックすると詳細画面に遷移し、該当レポートの残りの項目が表示されます。また、詳細画面からコメントをすることもできます。

#  要件

- ユーザー登録機能
- ユーザー詳細・編集・削除機能
- レポート投稿機能
- レポート一覧機能
- レポート詳細・編集・削除機能
- レポート検索機能
- コメント投稿機能
- コメント表示機能
- コメント削除機能
- アーティスト一覧機能
- アーティスト詳細機能
- いいね機能

# 実装済みの機能

**ユーザー登録機能**

![ユーザー登録](https://gyazo.com/c9e67ffdbd1735a3872870b35022ea6a)

**ユーザー詳細・編集・削除機能**

![ユーザー詳細・編集・削除機能](https://gyazo.com/350af313b569e5ea1ac2c727dc0aa728)

**レポート投稿・一覧表示機能**

![レポート投稿・一覧表示機能](https://gyazo.com/8d190adb2c9b7ca3ee10cbe4f3304288)

**レポート詳細・編集・削除機能**

![レポート詳細・編集・削除機能]()

**コメント投稿・表示機能・削除機能**

![コメント投稿・表示・削除機能](https://gyazo.com/21a6f0f1012b039e62b804d74f6a22d1)

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

|    column   |     type   |      options     |
| ----------- | ---------- | ---------------- |
|    title    |   string   |    null:false    |
|     text    |    text    |    null:false    |
|  recommend  |    text    | ---------------- |
|   violent   |    float   |    null:false    |
| with_family |    float   |    null:false    |
| preparation |    float   |    null:false    |
|     user    | references | foreign_key:true |

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