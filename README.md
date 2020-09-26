# README

# アプリ名
Idee

# 概要
プロダクトについてのアイデアを投稿ページで投稿。
投稿ページで作成したアイデアが一覧ページで表示される。
表示されているアイデア画像がリンクになっていて、アイデアについてコメントするチャット画面に移転する。

# 本番環境(デプロイ先　テストアカウント＆ID)
 https://idee-28261.herokuapp.com/
 テストアカウント:
 ID:

 # 制作意図
 オリジナルアプリの作成案を模索していた際に、なかなかアイデアが思い浮かばず、
 もしアプリのアイデアがまとまっているサイトがあったらインスピレーションを得ることができるのではないかと考え制作に到りました。

 Webアプリケーションや、ネイティブアプリケーション等のアイデアを持っているが
作成できない、不満足である人が。閲覧者とのチャットで繰り広げらる考察によってより良いアイデアにする場所を作りたかった。
# DEMO
coming soon...

# 工夫したポイント
一番工夫した点は,開発後に修正しやすいようにviewを細かく分けてファイルを作成したところです。
renderで呼び出すだけでみやすい記述になるので多用しました。
controllerなどはかなりシンプルな出来であるが、コメントアウトで記述の説明を入れて第三者がみても分かりやすいようにした。


# 開発環境
- VScode
- 

# 課題や今後実装したい機能
Herokuで扱う画像ファイルは一定時間で消えてしまうので、AWSを導入してアップロードした画像を保存されるように実装したい。
# DB設計

## users テーブル
| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| email                 | string  | null: false |
| password              | string  | null: false |
### Association
  has_one :profile
  has_many :ideas
  has_many :reviews
 
 ##  ideasテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| category             | integer | null: false |
| detail               | text    | null: false |
| cue                  | text    | null: false                    |
| feature              | text    | null: false                    |
| point                | text    | null: false                    |
| remark               | text    | null: false                    |
| user_id              | integer    | null: false                    |

### Association
belongs_to :user
has_many :reviews

##  profilesテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname             | string | null: false |
| introduction           | string   | null: false |
| user               |references|null: false ,foreign_key: true|
### Association
belongs_to :user

##  reviewsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| comment            | text | null: false |
| idea_id       | references   | null: false,foreign_key: true |
| user_id               |references|null: false ,foreign_key: true|
### Association
belongs_to :idea
belongs_to :user

