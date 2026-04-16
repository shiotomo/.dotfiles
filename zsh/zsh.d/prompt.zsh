precmd() { vcs_info }

PROMPT='%F{#4db8b2}[%n@%m:%f%F{#dfc898}%~%f%F{#4db8b2}]%f%F{#e8dcc8}[%D %*]%f
%B%(?,%F{#b0c8a4},%F{#c4622d})%(!,#,>>)%b%f '

RPROMPT='${vcs_info_msg_0_}%F{white}[$?]%f'
