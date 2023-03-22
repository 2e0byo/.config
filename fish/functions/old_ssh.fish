# Defined in - @ line 1
function old_ssh --wraps='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 alarum.lan' --description 'alias old_ssh=ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 alarum.lan'
  ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 alarum.lan $argv;
end
