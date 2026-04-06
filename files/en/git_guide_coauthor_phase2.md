# Git Guide Phase 2 (Branches)
> For those who have made Phase 1 (`pull → commit → push`) a habit.

---

## 1. What is a branch? (1-minute version)

**A branch is a safe copy of your files where you can experiment freely.**

Think of it in terms of paper writing:

- `main` branch = "the current agreed-upon draft"
- Working branch = "your personal working copy"

You work in your copy, and when it looks good, you *merge* it back into the main draft. The main draft stays clean at all times.

---

## 2. Workflow with branches

```
[Starting new work]
git pull                          # Get the latest version
git checkout -b branch-name       # Create and move to a new branch

--- work as usual ---

git add .
git commit -m "description"
git push origin branch-name       # Send your branch to GitHub

[When the work is ready]
→ Open GitHub and create a Pull Request (PR)
→ Daisuke will review and merge it into main
```

**Example:**

```bash
git pull
git checkout -b section3-revision   # Branch for revising Section 3

# --- work ---

git add .
git commit -m "Revised estimation method in Section 3"
git push origin section3-revision
```

---

## 3. New commands (4 additions)

| Command | Meaning | When to use |
|---------|---------|-------------|
| `git checkout -b branch-name` | Create and switch to a new branch | When starting new work |
| `git checkout main` | Switch back to the main branch | After finishing / switching tasks |
| `git branch` | See which branch you're on | When unsure |
| `git push origin branch-name` | Send your branch to GitHub | At the end of a session |

All Phase 1 commands (`pull`, `add`, `commit`, `status`) are still used.

---

## 4. What is a Pull Request (PR)?

A PR is a request made through the GitHub website saying "please merge my changes."

1. After `git push origin branch-name`, open GitHub
2. A "Compare & pull request" button will appear automatically
3. Write a title and description, then click "Create pull request"
4. Daisuke will review and merge it

**Do not merge it yourself. After submitting a PR, let Daisuke know.**

---

## 5. Naming branches

Keep names short and descriptive:

```
section3-revision       # Revisions to Section 3
add-robustness-check    # Adding robustness checks
fix-table2              # Fixing Table 2
data-cleaning-v2        # Data cleaning updates
```

No spaces — use hyphens `-` instead.

---

## 6. Common situations and responses

| Situation | What to do |
|-----------|------------|
| Forgot which branch you're on | `git branch` (the one with `*` is current) |
| Accidentally worked on main | Contact Daisuke |
| Want to delete a branch | Contact Daisuke |
| Need to make changes after submitting a PR | Run `add → commit → push` on the same branch — the PR updates automatically |

---

## 7. Phase 1 vs Phase 2 summary

| | Phase 1 | Phase 2 |
|--|---------|---------|
| Where you work | Always on main | Dedicated branch |
| How you push | `git push` | `git push origin branch-name` |
| Merging into main | Directly | Via PR, done by Daisuke |
| Safety of main | Moderate | High |

---

## 8. Cheat sheet (print this)

```
[Start]     git pull  →  git checkout -b branch-name
[Working]   git add .  →  git commit -m "description"
[End]       git push origin branch-name  →  create PR on GitHub  →  tell Daisuke
[Check]     git branch  /  git status
[If stuck]  Contact Daisuke (do not merge or delete on your own)
```

---

*Keep the Phase 1 guide handy too.*
