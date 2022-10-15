;; Remover mensagem de boas vindas
(setq inhibit-startup-message t)

(set-buffer-modified-p nil)
;; Remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remover barra rolagem
(scroll-bar-mode -1)

;; Numeros nas linhas
(global-linum-mode t)

;; tamanho da fonteaa
(set-face-attribute 'default nil :height 150)

;; Pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilitar inicio de ativacao

;; MELPA - repositorio
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
   ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
  ))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle))) ;; tecla atom
'
(use-package ace-window
  :ensure t)


;; ergo emacs
;;(use-package ergoemacs-mode
;;  :ensure t
;;  :config
;;  (progn
;;   (setq ergoemacs-theme nil)
;; (setq ergoemacs-keyboard-layout "us")
;;    (setq ergoemacs-mode 1)))


;; TEMA
(use-package rebecca-theme
  :ensure t
  :config (load-theme 'rebecca t))

;; syntax checker
;;(use-package flycheck
;;  :ensure t
;;  :init (global-flycheck-mode t))



;; meus atalhos - C is for Control. M is for Alt
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "M-o") 'ace-window)


;; SET full window
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; MELPA auto code stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("265f68939a70832a73137ef621b14882f83643882b1f0dfa2cd35b91b95afbcc" default)))
 '(package-selected-packages (quote (ergoemacs-mode ace-window which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Write backups to ~/.emacs.d/backups/
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old
