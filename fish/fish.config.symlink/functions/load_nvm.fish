# Switch to the node version of the closest .nvmrc when entering a project,
# and back to the default version when leaving it. nvm itself (slow, through
# bass) only runs when a switch is actually needed.
function load_nvm --on-variable PWD
    set -l nvmrc (nvm_find_nvmrc)
    if test -n "$nvmrc"
        set -l wanted (string trim < $nvmrc)
        test "$wanted" = "$__nvm_nvmrc_version"; and return
        nvm use $wanted 2>/dev/null; or nvm install $wanted
        and set -g __nvm_nvmrc_version $wanted
    else if set -q __nvm_nvmrc_version
        set -e __nvm_nvmrc_version
        _nvm_use_default
        echo "Reverting to default Node version ($(node -v))"
    end
end
