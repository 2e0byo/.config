# Defined in - @ line 2
function scan
	set dir scan(date '+%Y-%m-%d.%H-%M')
    mkdir $dir
    cd $dir
    for page in (seq 1 $argv[1])
        read -P "place page $page/$argv[1] on scanner and press enter "
        scanimage --format tiff --resolution 300 >p(printf "%03d" $page).tiff
        tput bel
    end

    for i in p*.tiff
        mogrify -normalize -level '72%, 27%'
    end
    tiffcp *.tiff scanned.tiff
    tiff2pdf -j scanned.tiff >scanned.pdf
    cd ../
    echo "scans are in $dir"
end
