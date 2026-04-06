# Git入門ガイド Phase 2（ブランチ編）
> Phase 1（`pull→commit→push`）が習慣化できた人向け。

---

## 1. ブランチとは何か（1分で理解）

**本文ファイルのコピーを作って、安全に実験する仕組み。**

論文執筆で言えば：

- `main`ブランチ ＝ 「現在の確定稿」
- 作業ブランチ ＝ 「草稿・実験用のコピー」

草稿で試して、良ければ確定稿にマージ（統合）する。確定稿は常にきれいな状態を保てる。

---

## 2. ブランチを使うワークフロー

```
【新しい作業を始めるとき】
git pull                        # 最新版を取得
git checkout -b 作業名           # 新しいブランチを作成・移動

--- ここで普通に作業 ---

git add .
git commit -m "〇〇を追加"
git push origin 作業名           # 自分のブランチをGitHubに送信

【作業がOKになったら】
→ GitHubでPull Request（PR）を作成
→ Daisukeが確認してmainにマージ
```

**具体例：**

```bash
git pull
git checkout -b section3-revision   # 第3節修正用ブランチ

# --- 作業 ---

git add .
git commit -m "第3節の推定方法を変更"
git push origin section3-revision
```

---

## 3. 新コマンド一覧（4つ追加）

| コマンド | 意味 | いつ使う |
|---------|------|---------|
| `git checkout -b ブランチ名` | 新ブランチを作成して移動 | 新しい作業を始めるとき |
| `git checkout main` | mainブランチに戻る | 作業完了後・切り替え時 |
| `git branch` | 今いるブランチを確認 | 迷ったとき |
| `git push origin ブランチ名` | 自分のブランチをGitHubに送信 | 作業終了後 |

Phase 1のコマンド（`pull`, `add`, `commit`, `status`）は引き続き全て使います。

---

## 4. Pull Request（PR）とは

GitHubのウェブ画面で行う「マージしてください」というリクエスト。

1. `git push origin ブランチ名` 後にGitHubを開く
2. 自動的に「Compare & pull request」ボタンが出る
3. タイトルと説明を書いて「Create pull request」
4. Daisukeが確認してマージする

**自分でマージしない。PRを出したらDaisukeに声をかける。**

---

## 5. ブランチ名のつけ方

短く・内容がわかるように：

```
section3-revision       # 第3節の修正
add-robustness-check    # ロバストネスチェック追加
fix-table2              # 表2の修正
data-cleaning-v2        # データ整理
```

スペースは使わず、ハイフン `-` でつなぐ。

---

## 6. よくある状況と対処

| 状況 | 対処 |
|------|------|
| 今どのブランチにいるか忘れた | `git branch`（`*`がついているのが現在地） |
| mainで作業してしまった | Daisukeに連絡 |
| ブランチを消したい | Daisukeに連絡 |
| PRを出した後に修正したい | 同じブランチで`add→commit→push`すればPRに自動反映 |

---

## 7. Phase 1との違いまとめ

| | Phase 1 | Phase 2 |
|--|---------|---------|
| 作業場所 | 常にmain | 専用ブランチ |
| push先 | `git push` | `git push origin ブランチ名` |
| mainへの統合 | 直接 | PRを通じてDaisukeが実施 |
| 確定稿の安全性 | やや低い | 高い |

---

## 8. チートシート（印刷用）

```
【作業開始】  git pull → git checkout -b ブランチ名
【作業中】    git add . → git commit -m "説明"
【作業終了】  git push origin ブランチ名 → GitHubでPR作成 → Daisukeに連絡
【確認】      git branch / git status
【困ったら】  Daisukeに連絡（自己判断でマージ・削除しない）
```

---

*Phase 1ガイドも引き続き手元に置いておいてください。*
