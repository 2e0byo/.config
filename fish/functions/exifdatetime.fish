# Defined in - @ line 2
function exifdatetime
	set current (exiv2 $argv[1] | grep 'Image timestamp' | string replace 'Image tiemstamp : ' '')
    echo Current timestamp is $current
    set newtime $argv[3]
    exiv2 -M"set Exif.Image.DateTime $argv[2] $newtime" $argv[1]
    exiv2 -M"set Exif.Photo.DateTimeOriginal $argv[2] $newtime" $argv[1]
    exiv2 -M"set Exif.Photo.DateTimeDigitized $argv[2] $newtime" $argv[1]
end
