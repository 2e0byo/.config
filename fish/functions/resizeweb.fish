
function resizeweb
	if [ ! -d ./web ]
        mkdir web
    end
    if [ $argv[1] ]
        set dpi $argv[1]
    else
        set dpi 72
    end

    find . -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname "*.bmp" \) \
        | parallel --bar --maxargs 1 -i {} "env MAGICK_THREAD_LIMIT=1 convert {} -resample $dpi web/(withext {} 'jpg')"\;
end
