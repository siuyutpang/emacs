;;; init-state.el -*- lexical-binding: t; -*-

(require 'saveplace)

;; 将 Emacs 的运行状态和 Custom 设置放到 XDG state 目录。
(let ((state-dir
       (expand-file-name
        "emacs/"
        (or (getenv "XDG_STATE_HOME")
            (expand-file-name "~/.local/state/")))))
  (make-directory state-dir t)
  (setq custom-file
        (expand-file-name "custom.el" state-dir)
        save-place-file
        (expand-file-name "places" state-dir)
        recentf-save-file
        (expand-file-name "recentf.eld" state-dir)
        tramp-persistency-file-name
        (expand-file-name "tramp" state-dir)
        auto-save-list-file-prefix
        (expand-file-name "auto-save-list/.saves-" state-dir))
  (when (file-exists-p custom-file)
    (load custom-file nil 'nomessage))
  (save-place-mode 1))

(provide 'init-state)
