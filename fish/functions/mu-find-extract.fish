# Defined in - @ line 1
function mu-find-extract
	for i in (mu find $argv -f l)
        mu extract -a $i
    end
end
