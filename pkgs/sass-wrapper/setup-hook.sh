make_sass_find_includes() {

    # where to find icon themes
    if [ -d "$1/share/scss" ]; then
      addToSearchPath SASS_PATH $1/share/scss
    fi
	
}

envHooks+=(make_sass_find_includes)
