[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# Claude Code snapshot compatibility: snapshot filters out functions starting with _.
# exec_scmb_expand_args calls _safe_eval which gets filtered; redefine to inline it.
exec_scmb_expand_args() {
    local args
    eval "args=$(scmb_expand_args "$@")"
    eval "$(token_quote "${args[@]}")"
}
