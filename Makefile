# https://gist.github.com/rgrove/1116056

CSS_FILES = $(filter-out %-min.css, $(wildcard src/*.css))

JS_FILES = $(filter-out %-min.js, $(wildcard src/*.js))

COMPRESSED_JS = $(wildcard src/*-min.js)

# Command to run to execute the YUI Compressor.
YUI_COMPRESSOR = java -jar build/yuicompressor-2.4.jar

# Flags to pass to the YUI Compressor for both CSS and JS.
YUI_COMPRESSOR_FLAGS = --charset utf-8

CSS_MINIFIED = $(CSS_FILES:.css=-min.css)
JS_MINIFIED = $(JS_FILES:.js=-min.js)

minify: removeConcat minify-css minify-js concat removeMinifiedJS
minify-css: $(CSS_MINIFIED)
minify-js: $(JS_MINIFIED)

concat:
	cat src/Notification-min.js src/Notifier-min.js src/Loader-min.js src/ProgressBar-min.js  > src/backbone.notificaitons-min.js

%-min.css: %.css
	@echo '==> Minifying $<'
	$(YUI_COMPRESSOR) $(YUI_COMPRESSOR_FLAGS) --type css $< >$@
	@echo

%-min.js: %.js
	@echo '==> Minifying $<'
	$(YUI_COMPRESSOR) $(YUI_COMPRESSOR_FLAGS) --type js $< >$@
	@echo

clean:
	rm -f $(CSS_MINIFIED) $(JS_MINIFIED)

removeMinifiedJS:
	rm -f $(JS_MINIFIED)

removeConcat:
	rm -f src/backbone.notificaitons-min.js
