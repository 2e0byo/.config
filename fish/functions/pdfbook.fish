# Defined in - @ line 1
function pdfbook --wraps=pdfbook2 --wraps='pdfbook2 --inner-margin=0 --outer-margin=0 --top-margin=0 --bottom-margin=0' --description 'alias pdfbook=pdfbook2 --inner-margin=0 --outer-margin=0 --top-margin=0 --bottom-margin=0'
  pdfbook2 --inner-margin=0 --outer-margin=0 --top-margin=0 --bottom-margin=0 $argv;
end
