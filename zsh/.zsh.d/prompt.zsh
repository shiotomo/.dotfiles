ip=`hostname -I | cut -f1 -d' '`
PROMPT='%F{cyan}[%n@%m:%f%F{yello}%~%f%F{cyan}]%f %F{green}[$ip]%f
%F{cyan}>>%f '
