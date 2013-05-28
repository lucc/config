##############################################################################
# dircolors file by luc
##############################################################################
# not on Mac OS X but used by tree
case `uname` in
  Linux|LINUX|linux)
    # reset variable
    LS_COLORS=
    # plain
    LS_COLORS="$LS_COLORS:no=00:fi=00"
    # other ?? (TODO)
    LS_COLORS="$LS_COLORS:di=01;35:ln=01;36:pi=40;33:so=01;35:do=01;35"
    LS_COLORS="$LS_COLORS:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41"
    LS_COLORS="$LS_COLORS:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32"
    # archives
    LS_COLORS="$LS_COLORS:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31"
    LS_COLORS="$LS_COLORS:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31"
    LS_COLORS="$LS_COLORS:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31"
    LS_COLORS="$LS_COLORS:*.jar=01;31"
    # img/video
    LS_COLORS="$LS_COLORS:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35"
    LS_COLORS="$LS_COLORS:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35"
    LS_COLORS="$LS_COLORS:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35"
    LS_COLORS="$LS_COLORS:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35"
    LS_COLORS="$LS_COLORS:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35"
    LS_COLORS="$LS_COLORS:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35"
    LS_COLORS="$LS_COLORS:*.mpc=01;35:*.ogg=01;35:*.wav=01;35"
    export LS_COLORS
    ;;
  Darwin)
    # http://www.mactips.org/archives/2005/08/02/color-your-os-x-command-prompt/
    # http://www.macosxhints.com/article.php?story=20031025162727485
    export CLICOLOR=1
    export LSCOLORS=FxFxCxDxBxegedabagacad
    #default
    alias normcolor='export LSCOLORS=exfxcxdxbxegedabagacad'
    ;;
esac
