(require 'quelpa)
(require 'quelpa-use-package)

(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "/Users/frank/Projects/elixir-ls"))

(use-package inf-iex
  :hook (elixir-mode . inf-iex-minor-mode)
  :quelpa (inf-iex :fetcher github
                   :repo "DogLooksGood/inf-iex"))
