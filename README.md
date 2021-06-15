# README

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
| recommend |   string   |    null:false    |
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