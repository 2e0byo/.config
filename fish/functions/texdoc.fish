# Defined in /tmp/fish.laaont/texdoc.fish @ line 2
function texdoc
    set outdir (mktemp -d)
    wget "http://texdoc.net/pkg/$argv[1]" -P $outdir
    mimeopen $outdir/*
end
