#!/bin/bash

set -xe

function install-tool() {
    TOOL_NAME=${1:?}
    TOOL_SCRIPT=${2:-${TOOL_NAME}.sh}

    render-autocomplete $TOOL_NAME

	install -D -m 0755 -v $TOOL_SCRIPT ${HOME}/.local/bin/${TOOL_NAME}
	install -D -m 0755 -v autocomplete.bash ${HOME}/.bash_completion.d/${TOOL_NAME}.bash
	install -D -m 0400 -v README.md ${HOME}/.local/share/doc/${TOOL_NAME}.md
    [ "$TOOL_NAME" == "cli-boilerplate" ] && install -D -m 0400 -v autocomplete.bash.template $HOME/.local/share/$AUTOCOMPLETE_TEMPLATE
	< $HOME/.bash_completion grep ${TOOL_NAME}.bash || echo "source \$HOME/.bash_completion.d/${TOOL_NAME}.bash" >> $HOME/.bash_completion
}

function render-autocomplete() {
    TOOL_NAME=${1:?}

    AUTOCOMPLETE_TEMPLATE=autocomplete.bash.template
    if [ -s $AUTOCOMPLETE_TEMPLATE ]; then
        echo "found local: $AUTOCOMPLETE_TEMPLATE"
    else
        AUTOCOMPLETE_TEMPLATE=$HOME/.local/share/$AUTOCOMPLETE_TEMPLATE
    fi

    < $AUTOCOMPLETE_TEMPLATE sed 's/%CLI_SCRIPT_NAME%/'${TOOL_NAME}'/g' > autocomplete.bash
}


# write to a separate script
# also somewher reading readme
# function help() {
#     echo "help for $me"
#     < bao.sh awk 'BEGIN {fstart=0} /^function bao/ {fstart=NR; print $2} fstart>0 { if ( $0 ~ /.+=\$\{[1-9].*/ ) {print $0} else {fstart=0} }'
# }


$@
