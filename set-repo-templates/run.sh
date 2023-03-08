#!/usr/bin/env bash

# Sigh, this is happens when you just want to write a "small script" to automate boring tasks.

set -e

SOURCE_DIR=$(pwd)
LOG_FILE="$SOURCE_DIR/log.txt"

function commit() {
  local msg="$1"

  if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "$msg" >>"$LOG_FILE" 2>&1
    echo "Commiting changes for commit $msg"
  else
    echo "No changes to commit for commit $msg"
  fi
}

function apply_default_issue() {
  local org="$1"
  local repo="$2"
  local issueSuffix="$3"

  local targetDir=".github/ISSUE_TEMPLATE"
  mkdir -p $targetDir
  cp "$SOURCE_DIR/default-issue-${issueSuffix}.md" "$targetDir/default-issue.md"

  commit "chore: Set issue template"
}

function apply_default_issue_english() {
  apply_default_issue "$1" "$2" "english"
}

function apply_default_issue_norwegian() {
  apply_default_issue "$1" "$2" "norwegian"
}

function apply_codeowners() {
  mkdir -p .github
  cp "$SOURCE_DIR/CODEOWNERS" .github/

  commit "chore: Set CODEOWNERS"
}

function apply_pr_template() {
  mkdir -p .github
  cp "$SOURCE_DIR/pull_request_template.md" .github/

  commit "chore: Set pull request template"
}

function push_and_open() {
  # Safe to force push because we checked that branch didn't exist in the start of this script
  git push --force >>"$LOG_FILE" 2>&1
  xdg-open "https://github.com/$curOrg/$curRepo"
}

function clone() {
  local org="$1"
  local repo="$2"
  local branch="$3"
  local orgSlashRepo="$org/$repo"
  local tmpDir=$(mktemp --directory)

  echo "---------------------------------"
  echo "Cloning $orgSlashRepo"
  echo "---------------------------------"
  cd "$tmpDir" || exit 10
  gh repo clone "$orgSlashRepo" >>"$LOG_FILE" 2>&1
  cd "$repo" || exit 20

  local branchExists=$(git ls-remote --heads "git@github.com:$orgSlashRepo.git" "$branch" | wc -l)
  if [[ ! $branchExists -eq 0 ]]; then
    echo "Error: Branch already exists: $branch"
    exit 30
  fi

  git checkout -b 0-set-repo-templates
}

if [[ -f log.txt ]]; then
  rm log.txt
fi

branch="admin_120-set_repo_defaults"
curOrg="oslokommune"

# Code repos
curRepo="golden-path-iac"
clone $curOrg $curRepo $branch
apply_codeowners
apply_pr_template
apply_default_issue_english $curOrg $curRepo
push_and_open $curOrg $curRepo

curRepo="reusable-workflows"
clone $curOrg $curRepo $branch
apply_codeowners
apply_pr_template
apply_default_issue_english $curOrg $curRepo
push_and_open $curOrg $curRepo

curRepo="composite-actions"
clone $curOrg $curRepo $branch
apply_codeowners
apply_pr_template
apply_default_issue_english $curOrg $curRepo
push_and_open $curOrg $curRepo

# Other repos
curRepo="kjoremiljo-admin-issues"
clone $curOrg $curRepo $branch
apply_codeowners
apply_default_issue_norwegian $curOrg $curRepo
push_and_open $curOrg $curRepo

curRepo="kjoremiljo-confidential-issues"
clone $curOrg $curRepo $branch
apply_codeowners
apply_default_issue_norwegian $curOrg $curRepo
push_and_open $curOrg $curRepo
