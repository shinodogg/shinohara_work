### 英単語学習アプリ
直感的に学べるシンプルな学習サイトです。

### 使い方
1. http://blazing-moon-318.heroku.com/ にアクセスします。
2. registリンクからメールアドレスとパスワードを登録してログインします。
　 ログイン認証はdevise(https://github.com/plataformatec/devise)を使用しています。
3. Studyページでランダムに表示される問題を解いていきます。
　 RDBMSのRONDOM関数を使用しています。
4. Answerページに解答が表示されますが下部のWordNetリンク押下で
　 AjaxでWordNetAPIにアクセスして結果を表示します。
5. Next Question!リンクで次の問題にうつります。
6. Your Resultリンクで自分の解答履歴が確認できます。
　 履歴はwill_paginateを使用しています。
7. Quiz Resultリンクでその問題の全体の正誤数が確認できます。
　 modelのscopeを使用して算出することでControllerをキレイに保っています。
8. validationとRSpecを使用したテストが不十分です。。DBのインデックス等も。。
