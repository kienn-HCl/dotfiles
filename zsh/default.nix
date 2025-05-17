{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    initExtraFirst = ''
      DIRSTACKSIZE=100
      setopt auto_pushd
      setopt pushd_ignore_dups

      setopt nolistbeep
      setopt interactive_comments
      setopt magic_equal_subst
      setopt hist_verify
    '';
    autocd = true;
    autosuggestion.enable = true;
    completionInit = "autoload -Uz compinit && compinit";
    enableCompletion = true;
    history = {
      size = 100000;
      save = 100000;
      ignoreAllDups = true;
    };
    sessionVariables = {
      ABBR_SET_EXPANSION_CURSOR = 1;
    };
    shellAliases = {
      ls = "lsd";
    };
    zsh-abbr = {
      enable = true;
      abbreviations = {
        l = "ls -l";
        la = "ls -a";
        lla = "ls -la";
        lt = "ls --tree";
        ":q" = "exit";
        ga = "git add";
        gst = "git status";
        gcm = "git commit -m \"%\"";
        gd = "git diff";
        rscp = "rsync -ah --no-i-r --info=progress2";
      };
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "pattern"
      ];
      patterns = {
        "rm *" = "fg=white,bold,bg=red";
      };
      styles = {
        autodirectory = "fg=brack,bg=green";
        bracket-level-1 = "fg=blue,bold";
        bracket-level-2 = "fg=green,bold";
        bracket-level-3 = "fg=yellow,bold";
        bracket-level-4 = "fg=magenta,bold";
      };
    };
    initExtra = ''
      if [[ -f "$HOME/.zsh/plugins/zsh-abbr//share/zsh/zsh-abbr/zsh-abbr.zsh" ]]; then
        source "$HOME/.zsh/plugins/zsh-abbr//share/zsh/zsh-abbr/zsh-abbr.zsh"
      fi
      for p in ${pkgs.fzf}/share/fzf/*.zsh; do
        . $p
      done
    '';
    defaultKeymap = "emacs";
  };
}
