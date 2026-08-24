# /etc/portage/bashrc
# Нативно разрешаем Git-елассам обновлять индексы внутри официального DISTDIR
# #737136  #558556
if [[ ${EBUILD_PHASE} == "fetch" || ${EBUILD_PHASE} == "unpack" ]]; then
    if [[ -d "/var/cache/distfiles/git3-src" ]]; then
        addwrite "/var/cache/distfiles/git3-src"
    fi
fi

