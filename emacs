;;;;;;;;;;;style

(load-theme 'wombat)

(setq frame-title-format "emacs")

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

;;find file complete
(ido-mode)

(column-number-mode)

;;show matching parentheses
(show-paren-mode)

;;(global-hl-line-mode)

;;; move window by shift and arrow keys
(windmove-default-keybindings)

;;;;;;pcakge
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     t)


(package-initialize)

(package-install 'flycheck)
(global-flycheck-mode)
;;; ido for M-x mode install smex
(global-set-key (kbd "M-x") 'smex)

;;kill smex mode 
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; auto complete install package ac-completex
(ac-config-default)

(linum-mode)

;;; auto complete parenthese  
;;(autopair-global-mode)

(global-set-key (kbd "C->") 'ace-jump-mode) 


;;;;;;;;;;;;;;; buffer
;;install package  switch-window
(global-set-key (kbd "C-M-z") 'switch-window)

;;;switch buffer to previous 
(global-set-key (kbd "C-o") 'mode-line-other-buffer)

;;;switch by window move
(global-set-key (kbd "C-x C-h") 'windmove-left)          ; move to left window
(global-set-key (kbd "C-x C-l") 'windmove-right)        ; move to right window
(global-set-key (kbd "C-x C-k") 'windmove-up)              ; move to upper window
(global-set-key (kbd "C-x C-j") 'windmove-down)          ; move to lower window



;;;;;;;;;;;;;;;;;;; c++ mode

;;;;;;; my own setting

(setq compilation-scroll-output 'first-error)
(setq compilation-read-command nil)
(setq compilation-ask-about-save nil)
(global-set-key [f8] 'next-error)
(global-set-key [f7] 'previous-error)
(global-set-key [f2] 'cppcm-compile)


;;;; cmake-ide setting  for all package auto load
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (multiple-cursors cpputils-cmake company-irony-c-headers flycheck-clangcheck company-c-headers flycheck switch-window smex rtags persp-mode minimap irony flymake flycheck-color-mode-line company-cmake cmake-ide auto-complete-clang ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;for company c-headers it is needed
(add-hook 'after-init-hook 'global-company-mode)
;;;;;;;;;;; cmake-ide
(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)




;;;;;;;;;;;;;for cpputil-cmake
(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )))
;; OPTIONAL, somebody reported that they can use this package with Fortran
(add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
;; OPTIONAL, avoid typing full path when starting gdb
(global-set-key (kbd "C-c C-g")
 '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
;; OPTIONAL, some users need specify extra flags forwarded to compiler
(setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))

