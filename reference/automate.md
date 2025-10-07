### :rocket: Automating Git with Bash

---

#### :bulb: Objective

- **Automate common Git tasks** (add, commit, push) using Bash scripts or shell functions.
- **Save time** and avoid repetitive typing.

---

#### :gear: Minimal Working Script

```bash
#!/bin/bash
# Exit on errors
set -e

# Check for a commit message
if [ -z "$1" ]; then
  echo "Usage: $0 \"commit message\""
  exit 1
fi

# Stage all changes
git add .

# Commit with the given message
git commit -m "$1"

# Push to the current branch
git push
```

---

#### :test_tube: How to Use

1. **Save as** `git-auto.sh`
2. **Make executable:**
   ```bash
   chmod +x git-auto.sh
   ```
3. **Run inside a Git repo:**
   ```bash
   ./git-auto.sh "update readme and scripts"
   ```

---

#### :warning: Risks & Improvements

- **`git add .`** stages everything (including unwanted files).
  - :shield: Use `git add -u` to only stage tracked files.
- **No feedback:** Add `echo` statements for clarity.
- **No branch handling:** Detect and push to the current branch.
- **No safety checks:** Ensure you’re inside a Git repo.

---

#### :dart: Enhanced Script Example

```bash
# Check if inside a Git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not a git repository."
  exit 1
fi

branch=$(git rev-parse --abbrev-ref HEAD)
echo "Adding changes..."
git add -u

echo "Committing with message: $1"
git commit -m "$1"

echo "Pushing to branch: $branch"
git push origin "$branch"
```

---

#### :brain: Automate via Bash Profile

**Option 1:** Add as a function in your `~/.bashrc` (or `~/.bash_profile` for macOS):

```bash
gitauto() {
  if [ -z "$1" ]; then
    echo "Usage: gitauto \"commit message\""
    return 1
  fi

  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not a git repository."
    return 1
  fi

  branch=$(git rev-parse --abbrev-ref HEAD)
  echo "Adding changes..."
  git add -u

  echo "Committing with message: $1"
  git commit -m "$1"

  echo "Pushing to branch: $branch"
  git push origin "$branch"
}
```

**Reload your shell:**
```bash
source ~/.bashrc
```

**Usage:**
```bash
gitauto "update script"
```

---

**Option 2:** Store as an external script and source it

1. **Create a scripts directory:**
   ```bash
   mkdir -p ~/.bashscripts
   ```
2. **Save your script (e.g., `gitauto.sh`)**
3. **Source in your `~/.bashrc`:**
   ```bash
   source ~/.bashscripts/gitauto.sh
   ```
4. **Reload:**
   ```bash
   source ~/.bashrc
   ```

---

#### :triangular_ruler: Trade-offs

- Loading many scripts can slow down shell startup.
- Sourcing scripts runs with your privileges—be careful!
- **Functions in `.bashrc`** are best for personal workflows.
- **External scripts** are better for version control and reuse.

---

#### :white_check_mark: Next Steps

Would you prefer to define several Git shortcuts this way (e.g., one for pull, one for stash/push), or combine them into one unified Git automation function with multiple modes?