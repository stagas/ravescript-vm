#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

#include "pffft.h"
#include "pffft_window.h"

typedef struct PFFFT_Runner PFFFT_Runner;

struct PFFFT_Runner{
	// The fft struct that is reused.
	PFFFT_Setup *fftSetup;

	size_t audioBlockSize;

	// Input fft data.
	float *fft_in;
	const float *fft_window;
};

int main(int argc, const char *argv[]){
	// NO OP, disable unused warnings.
	((void)argc);
	((void)argv);
}

PFFFT_Runner* pffft_runner_new(size_t audioBlockSize, int bytesPerAudioSample){
	PFFFT_Runner *runner = malloc(sizeof(PFFFT_Runner));

	runner->audioBlockSize = audioBlockSize;

	// The raw format and size of float should be 32 bits.
	assert(bytesPerAudioSample == sizeof(float));

	// The samples should be a 32bit float.
	int bytesPerAudioBlock = audioBlockSize * bytesPerAudioSample;

	// Initialize the pfft object.
	// We will use a size of audioblocksize
	// We are only interested in real part.
	runner->fftSetup = pffft_new_setup(audioBlockSize, PFFFT_REAL);

	runner->fft_in = pffft_aligned_malloc(bytesPerAudioBlock); //fft input
	runner->fft_window = pffft_window(audioBlockSize);

	return runner;
}

void pffft_runner_forward(PFFFT_Runner *runner, float *audio_data, float *fft_data){
	// Windowing + copy to fft input.
	for (size_t j = 0 ; j < runner->audioBlockSize; j++) {
		runner->fft_in[j] = audio_data[j] * runner->fft_window[j];
	}
	// Do the transform in place.
	pffft_transform_ordered(runner->fftSetup, runner->fft_in, fft_data, 0, PFFFT_FORWARD);
}

void pffft_runner_inverse(PFFFT_Runner *runner, float *fft_data, float *audio_data){
	// Windowing + copy to fft input.
	for (size_t j = 0; j < runner->audioBlockSize; j++) {
		runner->fft_in[j] = fft_data[j] * runner->fft_window[j];
	}
	// Do the transform in place.
	pffft_transform_ordered(runner->fftSetup, runner->fft_in, audio_data, 0, PFFFT_BACKWARD);
}

void pffft_runner_magnitudes(PFFFT_Runner *runner, float *fft_data, float *mags_data) {
  // Calculate magnitudes and find maximum value in place.
  size_t magnitudeIndex = 0;
  float maxMagnitude = 0.0;
  float leak = 1.0/65536.0; // avoid denormals
  for (size_t j = 0; j < runner->audioBlockSize; j += 2) {
    float mag =
			fft_data[j] 		* fft_data[j]
		+ fft_data[j + 1] * fft_data[j + 1]
		+ leak
		;

    if (mag > maxMagnitude) {
      maxMagnitude = mag;
    }

    mags_data[magnitudeIndex] = mag;
    magnitudeIndex++;
  }

  // Normalize magnitudes.
  for (size_t i = 0; i < magnitudeIndex; i++) {
    mags_data[i] /= maxMagnitude;
  }
}

void pffft_runner_destroy(PFFFT_Runner *runner){
	//cleanup fft structures
	pffft_aligned_free(runner->fft_in);

	pffft_destroy_setup(runner->fftSetup);

	free(runner);
}
