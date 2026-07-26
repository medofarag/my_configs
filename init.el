;; قائمة الحزم الأساسية
;; (vertico marginalia consult hl-todo company dracula)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; themes
(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-moonlight t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; إظهار أرقام الأسطر
(global-display-line-numbers-mode t)

;; تمييز الأقواس المتطابقة
(show-paren-mode t)

;; إغلاق الأقواس تلقائياً
(electric-pair-mode t)

;; تغيير التنقل بين بداية ونهاية الملف
(global-set-key (kbd "C-c <") 'beginning-of-buffer)   ;; بداية الملف
(global-set-key (kbd "C-c >") 'end-of-buffer)         ;; نهاية الملف

;; tab settings
(setq-default indent-tabs-mode nil)   ;; استخدم مسافات بدل Tab
(setq tab-width 4)                    ;; عرض المسافة البادئة (4 مسافات مثلاً)

;; إظهار شريط الألسنة دائماً
(tab-bar-mode t)

;; fix some issues
(setq package-install-upgrade-built-in t)

;; إظهار رقم كل لسان بجانب اسمه
(setq tab-bar-show 1)

;; اختصارات مريحة للألسنة
(global-set-key (kbd "C-<tab>") 'tab-next)  ;; التبديل إلى التالي
(global-set-key (kbd "M-<tab>") 'tab-previous)  ;; التبديل إلى السابق

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(package-selected-packages
   '(company consult corfu doom-themes dracula-theme eat eww-lnum hl-todo
             magit marginalia org org-roam treemacs vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
