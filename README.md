# Twitterクローンアプリ -Micropostsについて

![トップページ](readme_img/top.png)

twitterにある機能を自分の力で実装することを目的に作成したアプリです。<br>

◆herokuでアプリを公開していますhttps://micropost-threehouse.herokuapp.com<br>
ゲストとしてログインできます<br>
メールアドレス：guest@guest.guest<br>
パスワード：guest<br>

## 使用言語・技術  
Ruby:2.6.2 / Ruby on Rails:5.0.6 / bootstrap / html / css / git <br>

## 実装機能
実装機能<br>
・ログイン機能（Cookieとsessionによるログイン）<br>
・投稿機能(ユーザーとの紐付け）<br>
・コメント機能 (投稿、ユーザーとの紐付け）<br>
・いいね機能（中間テーブルの作成、紐付け）<br>
・いいねの非同期<br>
・フォロー機能（同じモデル同士で中間テーブルの作成、紐付け）<br>
・ページネーション(kaminariをカスタマイズ)<br>
・ゲストログイン（ゲスト権限の設定）<br>

## アピールポイント
・フォロー機能<br>
・ページネーションをカスタマイズしたこと<br>
Qiitaで記事を投稿しています。<br>
[【Rails初心者】ページネーションを実装して自分好みにデザインを変える](https://qiita.com/rio_threehouse/items/313824b90a31268b0074)<br>
・ゲストユーザーとしてログインできる<br>
・エラーメッセージの日本語化<br>

## 
タイムライン<br>
![トップページ](readme_img/home.png)
ユーザー一覧<br>
![トップページ](readme_img/follow.png)