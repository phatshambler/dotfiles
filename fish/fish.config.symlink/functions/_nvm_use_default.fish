# Put nvm's default node version on the PATH without loading nvm. The
# `default` alias (e.g. "24" or "lts/*") is resolved to the newest matching
# installed version.
function _nvm_use_default
    set -q NVM_DIR; or set -gx NVM_DIR $HOME/.nvm
    test -f $NVM_DIR/alias/default; or return 1

    set -l node_version (string trim < $NVM_DIR/alias/default)
    while test -f $NVM_DIR/alias/$node_version
        set node_version (string trim < $NVM_DIR/alias/$node_version)
    end
    set node_version (string replace -r '^v' '' -- $node_version)

    set -l dirs (path filter -d $NVM_DIR/versions/node/v$node_version $NVM_DIR/versions/node/v$node_version.*)
    test (count $dirs) -gt 0; or return 1
    set -l bin (printf '%s\n' $dirs | sort -V | tail -1)/bin

    # Replace any node version already on the PATH
    set -l path
    for dir in $PATH
        string match -q -- "$NVM_DIR/versions/node/*" $dir; or set -a path $dir
    end
    set -gx PATH $bin $path
    set -gx NVM_BIN $bin
end
