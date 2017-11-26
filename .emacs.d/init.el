(require 'package)
(setq package-enable-at-startup nil
      package-archives
      '(("gnu" . "http://elpa.gnu.org./packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa" . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))
(setq use-package-verbose t
      use-package-always-ensure t)
(eval-when-compile
   (require 'use-package))

(use-package helm
   :config
   (require 'helm-config)
   (global-set-key (kbd "M-x") 'helm-M-x)
   (global-set-key (kbd "C-x C-f") 'helm-find-files))

(use-package evil
   :init
   (evil-mode t)
   :config
   (use-package evil-leader
      :config
      (global-evil-leader-mode)
      (evil-leader/set-leader "<SPC>"))
   (use-package evil-surround
      :config
      (global-evil-surround-mode 1)))

(setq color-themes '())
(use-package color-theme-solarized
   :config
   (customize-set-variable 'frame-background-mode 'dark)
   (load-theme 'solarized t))
