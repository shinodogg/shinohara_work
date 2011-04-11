### 英単語学習アプリ
直感的に学べるシンプルな学習サイトです。

### 解説 
* http://blazing-moon-318.heroku.com/ にアクセスします。
* registリンクからメールアドレスとパスワードを登録してログインします。
* ログイン認証はdevise(https://github.com/plataformatec/devise)を使用しています。
* Studyページでランダムに表示される問題を解いていきます。RDBMSのRONDOM関数を使用しています。
* Answerページに解答が表示されますが下部のWordNetリンク押下でAjaxでWordNetAPIにアクセスして結果を表示します。
* Next Question!リンクで次の問題にうつります。
* Your Resultリンクで自分の解答履歴が確認できます。 履歴はwill_paginateを使用しています。
* Quiz Resultリンクでその問題の全体の正誤数が確認できます。
* Modelのscopeを使用して算出することでControllerをキレイに保っています。
* ModelのvalidationおよびRSpecを使用したテストが不十分です。。DBのインデックス等も。。
