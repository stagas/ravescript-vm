pffft_wasm:
	mkdir -p ../../dist/wasm
	emcc -o ../../dist/wasm/pffft.js pffft.c pffft_runner.c \
		 -O3 \
		 -msimd128 \
		 -Wall \
		 -W \
		 -s INITIAL_MEMORY=196608000 \
		 -s IMPORTED_MEMORY=1 \
		 -s SHARED_MEMORY=1 \
		 -s INVOKE_RUN=0 \
		 -s ASSERTIONS=0 \
		 -s MODULARIZE=1 \
		 -s ENVIRONMENT=worker \
		 -s EXPORT_ES6=1 \
		 -s EXPORT_NAME=pffft \
		 -s EXPORTED_FUNCTIONS=_malloc,_free,_pffft_runner_new,_pffft_runner_destroy,_pffft_runner_magnitudes,_pffft_runner_forward,_pffft_runner_inverse \
		 -s EXPORTED_RUNTIME_METHODS="[cwrap]" \

pffft_clang:
	clang -o test_pffft -DHAVE_VECLIB -O3 -Wall -W pffft.c pffft_runner.c

.PHONY: pffft_wasm pffft_clang
