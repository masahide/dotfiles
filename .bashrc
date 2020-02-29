SSHAGENT="${HOME}/.ssh/agent"
[[ $SSH_AUTH_SOCK != $SSHAGENT && -S $SSH_AUTH_SOCK ]] \
    && ln -snf "$SSH_AUTH_SOCK" "$SSHAGENT" \
    && export SSH_AUTH_SOCK="$SSHAGENT"

