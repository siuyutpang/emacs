;;; init-editing.el -*- lexical-binding: t; -*-

;; 相对行号，并预留稳定的行号宽度。
(setq display-line-numbers-type 'relative
      display-line-numbers-width-start t)
(global-display-line-numbers-mode 1)

;; 光标接近窗口上下边缘时提前滚动，保留 5 行边距。
(setq scroll-margin 5
      scroll-conservatively 101)

;; 高亮 Markdown 围栏代码块。
(setq markdown-fontify-code-blocks-natively t)

;; 让 YAML 键名在当前主题下与普通文字区分开。
(defun my-yaml-highlight-keys ()
  (face-remap-add-relative 'font-lock-variable-name-face 'font-lock-keyword-face))
(add-hook 'yaml-mode-hook #'my-yaml-highlight-keys)

;; 在编程模式和 Markdown 模式自动补括号。
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'markdown-mode-hook #'electric-pair-local-mode)

;; 关闭备份文件和自动保存文件；代价是无法用它们恢复旧版本或崩溃内容。
(setq make-backup-files nil
      auto-save-default nil)

(provide 'init-editing)
