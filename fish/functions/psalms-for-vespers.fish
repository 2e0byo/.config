# Defined in /tmp/fish.W7jIdz/psalms-for-vespers.fish @ line 2
function psalms-for-vespers
	set propers_file $argv[1]
    set output_dir $argv[2]
    set psalm $argv[3]
    set number $argv[4]
    echo "\newcommand{\psalm$number}{">>$propers_file
    ./psalm-parser.py psalms/$psalm.tex -g >>$propers_file
    echo -e "}\n\n">>$propers_file
    cp psalms/$psalm.gabc $output_dir/psalm$number.gabc
end
