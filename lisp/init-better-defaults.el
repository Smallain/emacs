(setq ring-bell-function 'ignore)


(global-auto-revert-mode t)

(global-linum-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8zl" "zilongshanren")
					    ;; Microsoft
					    ("8ms" "Macrosoft")
					    ;; Shifu
					    ("8zl" "zilongshanren")
					    ;; Tudi
					    ("8lxy" "lixinyang")
					    ))

(setq make-backup-files nil)

(setq auto-save-default nil)



(recentf-mode 1)			
(setq recentf-max-menu-items 25)


(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

;; 关闭 Emacs 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭自动保存文件
(setq auto-save-default nil)


;; 也许你并不喜欢听到错误时的“哔哔”的警告提示音，使用下面的代码你可以关闭 Emacs 中的警告音
(setq ring-bell-function 'ignore)

;; 每一次当 Emacs 需要与你确认某个命令时需要输入 (yes or no) 比较麻烦，所有我们可 以使用下面的代码，设置一个别名将其简化为只输入 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)


;; 可以帮我们重新缩进所选区域的代码，但是每一次都选中十分麻烦。使用 下面的代码可以一次重新缩进全部缓冲区的代码。

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


;;Company 有时候补全功能并不是非常理想，这时就可以使用 Hippie Expand 来完成补全。 Company Mode 补全效果不理想的原因是在不同的区域中会使用不同的后端函数来完成补全， 但是当后端补全函数不能被激活时，则补全就不会被激活。

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


(global-set-key (kbd "s-/") 'hippie-expand)


;; 每一次你进入一个回车进入一个新的目录中是，一个新的缓冲区就会被建立。这使 得我们的缓冲区列表中充满了大量没有实际意义的记录。我们可以使用下面的代码，让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区。
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
(require 'dired-x)


;; 因为每次保存中文的时候都需要选择解码，我们可以使用下面的配置将文本解码设置默认为 UTF-8
(set-language-environment "UTF-8")



;; 安装好 ag 后我们就可以安装 helm-ag 插件了。（它的 GitHub 仓库地址在这里）在安装 完成后可以为其设置快捷键，
(global-set-key (kbd "C-c s") 'helm-do-ag-project-root)


(provide 'init-better-defaults)
