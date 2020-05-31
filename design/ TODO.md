Ideas

* user-story based ticket management service for designer / developers.
* have date range picker on the bottom
* mark the one with overdue
* main concept: design/ref/aboard.gif
  * have weekly priority
  * have fe/backend/devops tabs

Sprint (P2)
- name
- duration: startAt - endAt

Project
- hasMany tasks

Task
- title
- description
- acceptance criteria
- belongsTo: sprint
- label
- user
- sub-tasks
- status
- note: blocked (shows icon on sprint)

User stories
P1
* I want to create a task
* I want to move a task to in progress/done
* I want to

P2
* I want to know which tasks are completed for the day so that I feel motivated (use datepicker on the bottom)
* I want to share the progress for the day so that I feel motivated

-------------------------

アプリ概要
 - ユーザはこの Web アプリを利用することで、カンバンボードによるタスク管理できます。
 - 画面としてはカンバンボード画面一つです。

 カンバンボード画面について
 - カンバンボード画面では、カンバン形式でタスクを可視化します。
 - 状態ごとにレーンが用意されていて、そこにタスクが並びます。
 - 「タスク登録」ボタンを押すことで、タスク登録用のモーダルウィンドウを出せます。
 - モーダルウィンドウ内でタスクの設定を指定して、「登録する」ボタンを押すことでタスクを登録します。
 - ドラッグでレーンを移動することで、タスクの状態を更新します。

 タスクについて
 - タスクにはタイトル、状態、完了予定日を設定できます。
 - 状態は ToDo（要対応）, In Progress（対応中）, Done（完了）の三つから選択できます。

 留意事項
 - ログイン機能やプロジェクト管理機能は設けません。
 　（全ユーザがゲストアカウントとして一つのプロジェクトを共有するようなイメージになります。）
 - タスクのタイトル&完了予定日の変更機能、タスクの削除機能は設けません。
