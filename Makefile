TOOL_NAME=oda-executors-cli

install: autocomplete.bash
	install -D -m 0755 -v x.sh ${HOME}/.local/bin/${TOOL_NAME}
	install -D -m 0755 -v autocomplete.bash ${HOME}/.bash_completion.d/${TOOL_NAME}.bash
	install -D -m 0400 -v README.md ${HOME}/.local/share/doc/${TOOL_NAME}.md
	< $(HOME)/.bash_completion grep ${TOOL_NAME}.bash || echo 'source $$HOME/.bash_completion.d/${TOOL_NAME}.bash' >> $(HOME)/.bash_completion

autocomplete.bash:
	< autocomplete.bash.template  sed 's/%CLI_SCRIPT_NAME%/'${TOOL_NAME}'/g' > autocomplete.bash

