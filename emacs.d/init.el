(package-initialize)

(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(global-display-line-numbers-mode)
(show-paren-mode 1)
(save-place-mode 1)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file 'noerror)

(setq-default indent-tabs-mode nil)
(setq mouse-yank-at-kill t)
(setq require-final-newline t)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq save-place-file (concat dotfiles-dir "places"))

(setq ido-decorations
      '("\n=> " "" "\n" "" "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))

(package-install-selected-packages)

(load-theme 'base16-materia t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-window-fixed-size nil)
(setq uniquify-buffer-name-style 'forward)

(windmove-default-keybindings)

(rg-enable-default-bindings)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

(global-set-key (kbd "M-j")
		(lambda ()
		  (interactive)
		  (join-line -1)))

(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-o") 'other-window)
