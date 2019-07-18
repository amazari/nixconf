{ pkgs ? import <nixpkgs> {} }:
let

emacsWithPackages = pkgs.emacsPackagesNg.emacsWithPackages;

baseEmacsConfig = ''
  (package-initialize)

  (setq make-backup-files nil) ; stop creating backup~ files
  (setq auto-save-default nil) ; stop creating #autosave# files
  (setq create-lockfiles nil)


  (setq inhibit-splash-screen t)
  (setq inhibit-startup-message t)
  (setq inhibit-startup-screen t)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (show-paren-mode t)
  (menu-bar-mode -1)
  (global-linum-mode 1)
  (blink-cursor-mode -1)
  (setq-default cursor-type '(bar . 2))
  (global-hl-line-mode t)
  (delete-selection-mode 1)
  (column-number-mode 1)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (electric-pair-mode 1)
  (setq-default require-final-newline 'visit-save)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (setq c-basic-offset 2) ; indents 4 chars
  (setq tab-width 2)          ; and 4 char wide for TAB
  (setq indent-tabs-mode nil) ; And force use of spaces

  (global-undo-tree-mode)

  ;;(defun loader-after-plugins ()
  ;;)
  ;;(add-hook 'after-init-hook #'loader-after-plugins)
''
;


firaFontConfig = ''
(defun fira-code-mode--make-alist (list)
  "Generate prettify-symbols alist from LIST."
  (let ((idx -1))
    (mapcar
     (lambda (s)
       (setq idx (1+ idx))
       (let* ((code (+ #Xe100 idx))
          (width (string-width s))
          (prefix ())
          (suffix '(?\s (Br . Br)))
          (n 1))
     (while (< n width)
       (setq prefix (append prefix '(?\s (Br . Bl))))
       (setq n (1+ n)))
     (cons s (append prefix suffix (list (decode-char 'ucs code))))))
     list)))

(defconst fira-code-mode--ligatures
  '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
    "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
    "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
    "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
    ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
    "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
    "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
    "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
    ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
    "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
    "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
    "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
    "x" ":" "+" "+" "*"))

(defvar fira-code-mode--old-prettify-alist)

(defun fira-code-mode--enable ()
  "Enable Fira Code ligatures in current buffer."
  (setq-local fira-code-mode--old-prettify-alist prettify-symbols-alist)
  (setq-local prettify-symbols-alist (append (fira-code-mode--make-alist fira-code-mode--ligatures) fira-code-mode--old-prettify-alist))
  (prettify-symbols-mode t))

(defun fira-code-mode--disable ()
  "Disable Fira Code ligatures in current buffer."
  (setq-local prettify-symbols-alist fira-code-mode--old-prettify-alist)
  (prettify-symbols-mode -1))

(define-minor-mode fira-code-mode
  "Fira Code ligatures minor mode"
  :lighter " Fira Code"
  (setq-local prettify-symbols-unprettify-at-point 'right-edge)
  (if fira-code-mode
      (fira-code-mode--enable)
    (fira-code-mode--disable)))

(defun fira-code-mode--setup ()
  "Setup Fira Code Symbols"
  (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol"))

(provide 'fira-code-mode)

'';

helmEmacsConfig = ''
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "C-x f") #'helm-recentf)
  (global-set-key (kbd "C-SPC") #'helm-dabbrev)
  (global-set-key (kbd "M-y") #'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") #'helm-buffers-list)


'';


tabbarConfig = ''

;; Tab Bar
(require 'tabbar)
(customize-set-variable 'tabbar-background-color "gray20")
(customize-set-variable 'tabbar-separator '(0.5))
(customize-set-variable 'tabbar-use-images nil)
(tabbar-mode 1)

;; My preferred keys
(define-key global-map [(alt j)] 'tabbar-backward)
(define-key global-map [(alt k)] 'tabbar-forward)

;; Colors
(set-face-attribute 'tabbar-default nil
        :background "gray20" :foreground
        "gray60" :distant-foreground "gray50"
        :family "Helvetica Neue" :box nil)
(set-face-attribute 'tabbar-unselected nil
        :background "gray80" :foreground "black" :box nil)
(set-face-attribute 'tabbar-modified nil
        :foreground "red4" :box nil
        :inherit 'tabbar-unselected)
(set-face-attribute 'tabbar-selected nil
        :background "#4090c0" :foreground "white" :box nil)
(set-face-attribute 'tabbar-selected-modified nil
        :inherit 'tabbar-selected :foreground "GoldenRod2" :box nil)
(set-face-attribute 'tabbar-button nil
        :box nil)

;; Use Powerline to make tabs look nicer
;; (this needs to run *after* the colors are set)
(require 'powerline)
(defvar my/tabbar-height 20)
(defvar my/tabbar-left (powerline-wave-right 'tabbar-default nil my/tabbar-height))
(defvar my/tabbar-right (powerline-wave-left nil 'tabbar-default my/tabbar-height))
(defun my/tabbar-tab-label-function (tab)
  (powerline-render (list my/tabbar-left
                          (format " %s  " (car tab))
                          my/tabbar-right)))
(setq tabbar-tab-label-function #'my/tabbar-tab-label-function)

'';



danteEmacsConfig = ''
  (require 'ansi-color)
  (defun display-ansi-colors ()
    (interactive)
    (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))

  (defun dante-no-color-mode ()
   (let ((old-term (getenv  "TERM"))
      (process-environment (cl-copy-list process-environment)))
      (setenv "TERM" "mono")
      (dante-mode)))

  ;;(add-hook 'haskell-mode-hook 'display-ansi-colors)
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-no-color-mode)
;;  (add-hook 'dante-mode-hook 'flycheck-mode)
  (add-hook 'dante-mode-hook 'company-mode)


  (add-hook 'flycheck-mode-hook
    '(lambda () (add-to-list 'flycheck-checkers 'haskell-dante)))
;;  (setq flycheck-check-syntax-automatically '(save mode-enabled))


  (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
  (eval-after-load "which-func"
    '(add-to-list 'which-func-modes 'haskell-mode))
'';

srSpeedbarConfig = ''
(defun speedbar-expand-all-lines ()
   "Expand all items in the speedbar buffer.
 But be careful: this opens all the files to parse them."
   (interactive)
   (goto-char (point-min))
   (while (not (eobp))
          (forward-line)
          (speedbar-expand-line)))
 (add-hook 'speedbar-mode 'haskell-decl-scan-mode)

(set 'speedbar-directory-unshown-regexp "^\\(dist\\|\\..*\\)\\'")
(set 'speedbar-frame-parameters
   (quote
    ((minibuffer)
     (width . 15)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . f)
     (left-fringe . 0))))
(set 'speedbar-query-confirmation-method (quote none-but-delete))
(set 'speedbar-smart-directory-expand-flag nil)
(set 'speedbar-update-flag nil)
(set 'speedbar-verbosity-level 0)
(set 'sr-speedbar-auto-refresh nil)
(set 'sr-speedbar-default-width 20)
(set 'sr-speedbar-max-width 25)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-skip-other-window-p t)
(setq speedbar-supported-extension-expressions
  (quote
   (".hs" ".cabal" ".nix")))

(setq speedbar-after-create-hook
  (quote
   (speedbar-frame-reposition-smartly speedbar-expand-all-lines)))

(sr-speedbar-open)
'';

emacsConfigPackage =  {pkgs, configText}: pkgs.emacsPackagesNg.trivialBuild {
    pname = "my-emacs-config-mode";
    version = "1970-01-01";
    src = pkgs.writeText "default.el" configText;
    };

emacsBasePackages = epkgs: (with epkgs.melpaPackages; [
  ansi
  magit
  helm
  helm-tramp
  helm-themes
  flycheck
  sr-speedbar
  tabbar
  powerline
]) ++
( with epkgs.elpaPackages; [
  undo-tree
]) ++
( with epkgs.orgPackages; [
  org
]);

configuredBaseEmacsPackages = epkgs: (emacsBasePackages epkgs) ++ [
(emacsConfigPackage {inherit pkgs; configText = baseEmacsConfig + firaFontConfig + helmEmacsConfig;})
];

nixDevEmacsPackages = epkgs: (emacsBasePackages epkgs) ++
( with epkgs.melpaPackages; [
  tabbar
  helm-nixos-options
  nix-mode
]);

configuredNixDevEmacsPackages = epkgs: (nixDevEmacsPackages epkgs) ++ [
(emacsConfigPackage {inherit pkgs; configText = baseEmacsConfig + helmEmacsConfig + firaFontConfig;})
];


haskellEmacsPackages = epkgs: ((nixDevEmacsPackages epkgs) ++
( with epkgs.melpaPackages; [

  flycheck-inline
  dante
]));

configuredHaskellEmacsPackages = epkgs: (haskellEmacsPackages epkgs) ++ [
(emacsConfigPackage {inherit pkgs; configText = baseEmacsConfig + helmEmacsConfig + firaFontConfig + srSpeedbarConfig + danteEmacsConfig;})
];
in {
    emacsBase = emacsWithPackages configuredHaskellEmacsPackages;
    emacsNixDev = emacsWithPackages configuredHaskellEmacsPackages;
    emacsHaskellDev = emacsWithPackages configuredHaskellEmacsPackages;

}
