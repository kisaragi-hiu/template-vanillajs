src_js := $(wildcard src/*.js)
src_css := $(wildcard src/*.css)

.PHONY: dev clean clean-all build watch-js watch-css open-browser

# * Utils
# Visit the page after a second
# Unless Firefox is already open and has a tab visiting the page
# (I've only bothered to support Firefox here)
open-browser:
	-(sleep 1 && \
	 !(pgrep firefox && python firefox-page-opened.py "localhost:8080") && \
	 xdg-open "http://localhost:8080")

clean:
	git clean -Xf

clean-all:
	git clean -Xdf

# * Development

watch-js:
	npx webpack serve --mode development --client-overlay

watch-css:
	npx tailwindcss --postcss -i src/main.css -o dist/built.css --watch

dev: dist/index.html
	npx concurrently "make open-browser" "make watch-js" "make watch-css"

# * build
build: dist/built.js dist/built.css dist/index.html

dist/built.js: $(src_js) package.json Makefile
	npx webpack --mode production

dist/built.css: $(src_css) package.json Makefile
	npx tailwindcss --minify --postcss -i src/main.css -o dist/built.css

# External resource demo
# Yes, this is what you do if you don't want to do it in Webpack.
#
# "Prior to webpack, front-end developers would use tools like grunt
# and gulp to process these assets and move them from their /src
# folder into their /dist or /build directory."
#
# --- https://webpack.js.org/guides/asset-management/
#
# dist/feather-icons: package.json
# 	-rm dist/feather-icons -r
# 	cp -r node_modules/feather-icons/dist dist/feather-icons
