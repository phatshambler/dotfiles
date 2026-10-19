# Same as `pyenv init - fish`, without running pyenv (~250 ms) at startup.
# Shims are refreshed by pyenv itself after `pyenv install` and pip installs.
# The shims are put first on the PATH in config.fish, after other conf.d files.
if test -d $PYENV_ROOT/shims
    set -gx PYENV_SHELL fish

    if status is-interactive; and test -f /opt/homebrew/opt/pyenv/completions/pyenv.fish
        source /opt/homebrew/opt/pyenv/completions/pyenv.fish
    end

    function pyenv
        set command $argv[1]
        set -e argv[1]

        switch "$command"
            case rehash shell
                source (pyenv "sh-$command" $argv | psub)
            case "*"
                command pyenv "$command" $argv
        end
    end
end
