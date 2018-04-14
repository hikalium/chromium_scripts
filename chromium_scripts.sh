# My Default gn args:
# gn gen out/Default --args='enable_nacl=false is_debug=false remove_webcore_debug_symbols=true'

# cr_build
function cr_build () {
	ninja -C out/Default chrome
}

# All:      $> cr_test_blink_unit *RenderedPosition*
# Filtered: $> cr_test_blink_unit *RenderedPosition*
function cr_test_blink_unit () {
	FILTER_ARGS=${1:+"--gtest_filter=$1"}
	echo "filter: ${FILTER_ARGS}"
	ninja -C out/Default webkit_unit_tests
	out/Default/webkit_unit_tests -t ${FILTER_ARGS}
}

# All:      $> cr_test_blink_layout
# Filtered: $> cr_test_blink_layout editing/
function cr_test_blink_layout () {
	ninja -C out/Default blink_tests
	third_party/WebKit/Tools/Scripts/run-webkit-tests -t Default $1
}

