# Roles of this machine (e.g. "dev", "pm" or "dev pm"), chosen by
# script/bootstrap and stored in ~/.dotfiles-roles. Defaults to "dev".
#
# Sourced by zshrc, script/install and macos/set-defaults.sh.

DOTFILES_ROLES_FILE="$HOME/.dotfiles-roles"

if [ -f "$DOTFILES_ROLES_FILE" ]
then
  DOTFILES_ROLES=$(xargs echo < "$DOTFILES_ROLES_FILE")
else
  DOTFILES_ROLES="dev"
fi
export DOTFILES_ROLES

# has_role <role>: true when this machine has <role>.
has_role () {
  case " $DOTFILES_ROLES " in
    *" $1 "*) return 0 ;;
  esac
  return 1
}

# topic_enabled <topic dir>: true when the topic has no .roles file, or when
# one of the roles listed in its .roles file (one per line) is a role of this
# machine. Uses `read` rather than `cat` to stay fast at shell startup.
topic_enabled () {
  [ -f "$1/.roles" ] || return 0
  while IFS= read -r role || [ -n "$role" ]
  do
    [ -n "$role" ] && has_role "$role" && return 0
  done < "$1/.roles"
  return 1
}
