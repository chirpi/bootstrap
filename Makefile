BOOTSTRAP_LESS = ./less/bootstrap.less
BOOTSTRAP_RESPONSIVE_LESS = ./less/responsive.less
API_URL=http://closure-compiler.appspot.com/compile
LESS_COMPRESSOR = /share/local/node_modules/less/bin/lessc
UGLIFYJS = /share/local/node_modules/uglify-js/bin/uglifyjs

#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# ${LESS_COMPRESSOR} & uglifyjs are required
#

bootstrap:
	rm -rf assets
	mkdir -p assets/font
	mkdir -p assets/css
	mkdir -p assets/js
	cp font/* assets/font/
	cp docs/PIE.htc assets/css/
	${LESS_COMPRESSOR} --compress ${BOOTSTRAP_LESS} > assets/css/std.min.css
	${LESS_COMPRESSOR} --compress ${BOOTSTRAP_RESPONSIVE_LESS} > assets/css/responsive.min.css
	cat js/jquery-1.7.2.min.js js/bootstrap-transition.js js/bootstrap-alert.js js/bootstrap-button.js js/bootstrap-carousel.js js/bootstrap-collapse.js js/bootstrap-dropdown.js js/bootstrap-modal.js js/bootstrap-tooltip.js js/bootstrap-popover.js js/bootstrap-scrollspy.js js/bootstrap-tab.js js/bootstrap-typeahead.js > assets/js/bootstrap.js
	${UGLIFYJS} -nc assets/js/bootstrap.js > assets/js/bootstrap.min.js
	rm assets/js/bootstrap.js
	tar cvzf webassets.tar.gz assets

bootstrap-cent:
	rm -rf assets
	mkdir -p assets/font
	mkdir -p assets/css
	mkdir -p assets/js
	cp font/* assets/font/
	cp docs/PIE.htc assets/css/
	${LESS_COMPRESSOR} --compress ./less/bootstrap-cent.less > assets/css/std.min.css
	${LESS_COMPRESSOR} --compress ${BOOTSTRAP_RESPONSIVE_LESS} > assets/css/responsive.min.css
	cat js/jquery-1.7.2.min.js js/bootstrap-transition.js js/bootstrap-alert.js js/bootstrap-button.js js/bootstrap-carousel.js js/bootstrap-collapse.js js/bootstrap-dropdown.js js/bootstrap-modal.js js/bootstrap-tooltip.js js/bootstrap-popover.js js/bootstrap-scrollspy.js js/bootstrap-tab.js js/bootstrap-typeahead.js > assets/js/bootstrap.js
	${UGLIFYJS} -nc assets/js/bootstrap.js > assets/js/bootstrap.min.js
	rm assets/js/bootstrap.js
	tar cvzf webassets.tar.gz assets

full:
	mkdir -p assets/font
	mkdir -p assets/css
	mkdir -p assets/js
	cp font/* assets/font/
	cp docs/PIE.htc assets/css/
	${LESS_COMPRESSOR} ${BOOTSTRAP_LESS} > assets/css/bootstrap.css
	${LESS_COMPRESSOR} --compress ${BOOTSTRAP_LESS} > assets/css/bootstrap.min.css
	${LESS_COMPRESSOR} ${BOOTSTRAP_RESPONSIVE_LESS} > assets/css/bootstrap-responsive.css
	${LESS_COMPRESSOR} --compress ${BOOTSTRAP_RESPONSIVE_LESS} > assets/css/bootstrap-responsive.min.css
	cat js/bootstrap-transition.js js/bootstrap-alert.js js/bootstrap-button.js js/bootstrap-carousel.js js/bootstrap-collapse.js js/bootstrap-dropdown.js js/bootstrap-modal.js js/bootstrap-tooltip.js js/bootstrap-popover.js js/bootstrap-scrollspy.js js/bootstrap-tab.js js/bootstrap-typeahead.js > assets/js/bootstrap.js
	${UGLIFYJS} -nc  assets/js/bootstrap.js > assets/js/bootstrap.min.js
	cp js/jquery-1.7.2.min.js assets/js/jquery.min.js
	tar cvzf webassets.tar.gz assets
