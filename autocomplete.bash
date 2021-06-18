
function _cli-boilerplate_script() {
    local cur prev opts base
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    cmds=$( < $(which cli-boilerplate)  awk -F'[ (]' '/^function/ {print $2}' )

    COMPREPLY=($(compgen -W "${cmds}" -- ${cur}))
    return 0
}

complete -o nospace -F _cli-boilerplate_script cli-boilerplate

