
function _oda-executors-cli_script() {
    local cur prev opts base
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    cmds=$( < $(which oda-executors-cli)  awk -F'[ (]' '/^function/ {print $2}' )

    COMPREPLY=($(compgen -W "${cmds}" -- ${cur}))
    return 0
}

complete -o nospace -F _oda-executors-cli_script oda-executors-cli

