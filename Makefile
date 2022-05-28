src_js := $(wildcard src/*.js)
src_css := $(wildcard src/*.css)

.PHONY: dev clean clean-all watch-js watch-css serve dev build

# * Utils

clean:
	git clean -Xf

clean-all:
	git clean -Xdf

# * Development

watch-js:
	npx rollup --config -w

watch-css:
	npx tailwindcss --postcss -i src/main.css -o dist/built.css --watch

serve:
	(cd dist/ && python -m http.server 8080 2>/dev/null)

dev: dist/index.html
	npx concurrently "make watch-js" "make watch-css" "make serve"

# * build
build: dist/built.js dist/built.css dist/index.html

dist/built.js: $(src_js) package.json Makefile
	npx rollup --config

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
