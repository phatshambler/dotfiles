# Pipe my public key to my clipboard.
pubkey() {
  local key
  for key in ~/.ssh/id_ed25519.pub ~/.ssh/id_rsa.pub
  do
    if [[ -f $key ]]
    then
      pbcopy < $key && echo "=> Public key ($key) copied to pasteboard."
      return
    fi
  done
  echo "=> No public key found in ~/.ssh" >&2
  return 1
}
