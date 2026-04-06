# Git Starter Guide (for co-authors)
> Think of it as "Dropbox, but better." This is all you need to read.

---

## 1. What is Git? (30-second version)

Like Dropbox, it **syncs your files**. But it also:

- Records *when*, *what*, and *why* you changed something
- Lets you go back to any earlier version at any time
- Means you never need to name files `_v2`, `_final`, `_FINAL_real` again

---

## 2. Your daily workflow (memorize this)

```
Before you start working
  → git pull

When you finish working
  → git add .
  → git commit -m "brief description"
  → git push
```

**Example:**

```bash
# At the start of each session (always do this first)
git pull

# --- edit your files as usual ---

# At the end of each session
git add .
git commit -m "Updated estimation results in Section 3"
git push
```

---

## 3. Command reference (just 5)

| Command | Meaning | When to use |
|---------|---------|-------------|
| `git pull` | Get the latest version | **Before every session — always** |
| `git add .` | Stage your changes | Before committing |
| `git commit -m "description"` | Save a snapshot | At each natural stopping point |
| `git push` | Send to GitHub | **After every session — always** |
| `git status` | Check the current state | When unsure |

---

## 4. If a conflict occurs

A conflict happens when two people edit the same part of a file at the same time. **No data is lost. Don't panic.**

The affected file will contain markers like this:

```
<<<<<<< HEAD
Your version
=======
Their version
>>>>>>> main
```

**How to resolve:**

1. Manually edit the section between `<<<<<<<` and `>>>>>>>` to keep the correct content
2. Then run these in order:

   ```
   git add .
   git commit -m "Resolved conflict"
   git push
   ```

**If you're unsure, contact Daisuke before doing anything.**

---

## 5. Common mistakes and fixes

| Situation | What to do |
|-----------|------------|
| Forgot to `git pull` before working | Run `git pull` and then commit. Resolve any conflicts as above. |
| Forgot to `git push` and noticed the next day | Just run `git push` — it's fine |
| Something seems broken | **Don't touch anything.** Contact Daisuke. |
| Unsure about commit message language | Either is fine. Just write something. |

---

## 6. Things never to do

- **Do not** `git add` data files (`.dta`, `.csv`, `.xlsx`) — they are excluded via `.gitignore`
- **Do not** commit passwords or credentials
- **Do not** delete the repository on your own if a conflict occurs

---

## 7. Cheat sheet (print this)

```
[Start of session]   git pull
[End of session]     git add .  →  git commit -m "description"  →  git push
[Check status]       git status
[If stuck]           Contact Daisuke
```

---

*Questions and issues are always welcome — just ask.*
