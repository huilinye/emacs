((magit-cherry-pick
  ("--ff"))
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  (("--" "src/mem_pool/memory_pool.cc")))
 (magit-pull
  ("--rebase"))
 (magit-push nil)
 (magit-rebase nil)
 (magit-reset nil)
 (magit-revert
  ("--edit")
  nil)
 (magit-stash nil
              ("--all"))
 (magit-tag nil))
