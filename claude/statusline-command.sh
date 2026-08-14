#!/usr/bin/env bash
# Claude Code status line
# Sections: dir  |  git branch+status  |  token usage  |  session cost

input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')

# --- Git: branch + dirty indicator ---
git_branch=$(git --no-optional-locks -C "$cwd" symbolic-ref --short HEAD 2>/dev/null)
git_status=""
if [ -n "$git_branch" ]; then
    if git --no-optional-locks -C "$cwd" diff --quiet HEAD 2>/dev/null; then
        git_status="clean"
    else
        git_status="dirty"
    fi
fi

# --- Token usage ---
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Format token counts as K
tok_str=$(awk -v ti="$total_input" -v to="$total_output" \
    'BEGIN { printf "%dk in / %dk out", int(ti/1000), int(to/1000) }')

# Add context % if available
if [ -n "$used_pct" ]; then
    tok_str=$(printf "%s  (%.0f%% ctx)" "$tok_str" "$used_pct")
fi

# --- Last-turn cost ---
# Pricing for claude-sonnet-4-6[1m] (per million tokens):
#   non-cache input: $3.00, output: $15.00, cache_write: $3.75, cache_read: $0.30
# current_usage holds the most recent API call's token breakdown.
cur_input=$(echo "$input" | jq -r '.context_window.current_usage.input_tokens // 0')
cur_output=$(echo "$input" | jq -r '.context_window.current_usage.output_tokens // 0')
cache_write=$(echo "$input" | jq -r '.context_window.current_usage.cache_creation_input_tokens // 0')
cache_read=$(echo "$input" | jq -r '.context_window.current_usage.cache_read_input_tokens // 0')

# non-cache input = input_tokens minus any cache-read tokens already counted there
# (input_tokens from API already excludes cache_creation and cache_read; they are separate)
cost=$(awk -v ci="$cur_input" -v co="$cur_output" -v cw="$cache_write" -v cr="$cache_read" \
    'BEGIN { printf "%.4f", (ci * 3.00 + co * 15.00 + cw * 3.75 + cr * 0.30) / 1000000 }')

cost_str=""
if awk -v c="$cost" 'BEGIN{exit !(c+0 > 0)}'; then
    cost_str="~\$${cost}/turn"
fi

# --- Assemble output ---
# Colors:
#   cyan   = directory
#   yellow = git branch
#   green  = clean / red = dirty
#   blue   = token usage
#   dim    = cost
SEP="\033[90m  |  \033[0m"

printf "\033[36m%s\033[0m" "$cwd"

if [ -n "$git_branch" ]; then
    if [ "$git_status" = "clean" ]; then
        printf "%b\033[33m%s\033[0m \033[32m*\033[0m" "$SEP" "$git_branch"
    else
        printf "%b\033[33m%s\033[0m \033[31m+\033[0m" "$SEP" "$git_branch"
    fi
fi

if [ "$total_input" -gt 0 ] 2>/dev/null || [ "$total_output" -gt 0 ] 2>/dev/null; then
    printf "%b\033[34m%s\033[0m" "$SEP" "$tok_str"
fi

if [ -n "$cost_str" ]; then
    printf "%b\033[90m%s\033[0m" "$SEP" "$cost_str"
fi
