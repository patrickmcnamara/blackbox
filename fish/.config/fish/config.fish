### Fish greeting
set -g fish_greeting (tty)

if status is-login
    ### $GOPATH and $PATH
    set -x GOPATH ~/.go
    set -x PATH $GOPATH/bin/ $PATH
    set -x PATH ~/.cargo/bin/ $PATH

    ### EDITOR, VISUAL, TERMINAL and PAGER
    set -gx EDITOR kak
    set -gx VISUAL kak
    set -gx TERMINAL alacritty
    set -gx PAGER less

    ### Make GnuPG gpg-agent ssh-agent thing work
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye > /dev/null

    ### Other Go stuff
    set -gx GO111MODULE on

    ### Start X at login
    if [ (tty) = "/dev/tty1" ]
        exec startx -- -keeptty > /dev/null 2>&1
    end
end
