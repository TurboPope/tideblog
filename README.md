# Tideblog
My little blog.

## Useage
Use rake to execute supported jekyll commands. Arguments are passed through. All dependency-installation outside of the list below will be taken care of.

``` bash
rake serve # See `jekyll serve`
rake build # See `jekyll build`
rake doctor # See `jekyll doctor'
rake guard # Like `serve` but with live-reload
```

Live-reloading with `rake guard` needs a browser-extension: http://livereload.com/extensions/

## Dependencies
* JavaScript runtime (`nodejs`)
* bundle (`bundler`)
* rake
* bower
