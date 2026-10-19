# Path of the closest .nvmrc, from the current directory up. Pure fish, so it
# can run on every `cd` (nvm's own version needs bash through bass, ~250 ms).
function nvm_find_nvmrc
    set -l dir $PWD
    while true
        if test -f $dir/.nvmrc
            echo $dir/.nvmrc
            return 0
        end
        test "$dir" = /; and return 1
        set dir (path dirname $dir)
    end
end
