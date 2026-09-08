function gitfiles() {
  local j=1
  local var
  while var="e${j}" && [[ "${!var+x}" ]]; do
    unset "e${j}"
    (( j++ ))
  done

  local i=1
  local file
  while IFS= read -r file; do
    export "e${i}=${file}"
    printf "  %2d  %s\n" "$i" "$file"
    (( i++ ))
  done < <(git-files "$@")
}

function _gf_expand() {
  local result=()
  local arg var i start end
  for arg in "$@"; do
    if [[ "$arg" =~ ^([0-9]+)-([0-9]+)$ ]]; then
      start="${BASH_REMATCH[1]}" end="${BASH_REMATCH[2]}"
      for (( i=start; i<=end; i++ )); do
        var="e${i}"
        if [[ "${!var+x}" ]]; then
          result+=("${!var}")
        else
          echo "_gf_expand: no file $i" >&2
        fi
      done
    elif [[ "$arg" =~ ^[0-9]+$ ]]; then
      var="e${arg}"
      if [[ "${!var+x}" ]]; then
        result+=("${!var}")
      else
        echo "_gf_expand: no file $arg" >&2
      fi
    else
      result+=("$arg")
    fi
  done
  printf '%s\0' "${result[@]}"
}

function ga() {
  local -a files
  while IFS= read -r -d '' f; do
    files+=("$f")
  done < <(_gf_expand "$@")
  git add "${files[@]}"
}
