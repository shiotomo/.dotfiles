precmd () { vcs_info }

PROMPT='%F{cyan}[%n@%m:%f%F{yello}%~%f%F{cyan}]%f%F{white}[%D %*]%f
%B%(?,%F{green},%F{red})%(!,#,>>)%b '
RPROMPT='${vcs_info_msg_0_}%F{white}[$?]%f'
