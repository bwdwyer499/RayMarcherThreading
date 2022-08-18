/*  The following code is a VERY heavily modified from code originally sourced from:
Ray tracing tutorial of http://www.codermind.com/articles/Raytracer-in-C++-Introduction-What-is-ray-tracing.html
It is free to use for educational purpose and cannot be redistributed outside of the tutorial pages. */

#define TARGET_WINDOWS

#pragma warning(disable: 4996)
#pragma warning(disable: 26495)
#include <stdio.h>
#include "Timer.h"
#include "Primitives.h"
#include "Scene.h"
#include "Lighting.h"
#include "Intersection.h"
#include "ImageIO.h"
#include "Distance.h"

//GLOBAL VARIABLES
// global pixel buffer for rendered image
unsigned int buffer[MAX_WIDTH * MAX_HEIGHT];
// ADDITION: The count of samples rendered  
unsigned int samplesRendered = 0;
// global scene file (used to simplify distance functions)
Scene scene;

//STRUCT
//ADDITION : ThreadData struct to hold all the parameters necessary for running the render function
typedef struct ThreadData {
	Scene scene;						// The scene rendered
	unsigned int threadID;				// Id of the thread
	unsigned int width;					// Amount of pixels in a row
	unsigned int height;				// Amount of pixles in a column
	unsigned int aaLevel;				// Anti-Aliasing level
	bool debugProgress;					// Bool to set the debugProgress
	bool testMode;						// Bool to set use of test mode
	bool colourise;						// Bool to set the use of colourisation in image
	unsigned int* outputStart;			// Pointer to a position to start writing samples
	int yPosOffset;
}ThreadData;


//ADDITION : outputStart (buffer) has been added to render parameters to specify where the output should start from.
// render scene at given width and height and anti-aliasing level
int render(Scene& scene, const int width, const int height, const int aaLevel, bool debugProgress, bool testMode, bool colourise, unsigned int* outputStart, int yPosOffset)
{
	// angle between each successive ray cast (per pixel, anti-aliasing uses a fraction of this)
	const float dirStepSize = 1.0f / (0.5f * width / tanf(PIOVER180 * 0.5f * scene.cameraFieldOfView));

	// pointer to output buffer
	unsigned int* out = outputStart; //ADDITION : outputStart (buffer)

	// count of samples rendered
	//unsigned int samplesRendered = 0; // SUBTRACTION : samplesRendered is now global

	// loop through all the pixels
	// tell the y a start y and and end y to render too!!!
	for (int y = (-height / 2) + yPosOffset; y < (height / 2) + yPosOffset; ++y)
	{
		// show where we're up to in the render at the start of each line
		if (debugProgress) printf("%d/%d  \r",(y - yPosOffset) + (height / 2), height);

		for (int x = -width / 2; x < width / 2; ++x)
		{
			Colour output(0.0f, 0.0f, 0.0f);

			// calculate multiple samples for each pixel
			const float sampleStep = 1.0f / aaLevel, sampleRatio = 1.0f / (aaLevel * aaLevel);

			// loop through all sub-locations within the pixel
			for (float fragmentx = float(x); fragmentx < x + 1.0f; fragmentx += sampleStep)
			{
				for (float fragmenty = float(y); fragmenty < y + 1.0f; fragmenty += sampleStep)
				{
					// direction of default forward facing ray
					Vector dir = { fragmentx * dirStepSize, fragmenty * dirStepSize, 1.0f };

					// rotated direction of ray
					Vector rotatedDir = {
						dir.x * cosf(scene.cameraRotation) - dir.z * sinf(scene.cameraRotation),
						dir.y,
						dir.x * sinf(scene.cameraRotation) + dir.z * cosf(scene.cameraRotation) };

					// view ray starting from camera position and heading in rotated (normalised) direction
					Ray viewRay = { scene.cameraPosition, normalise(rotatedDir) };

					// follow ray and add proportional of the result to the final pixel colour
					output += sampleRatio * traceRay(scene, viewRay);

					// count this sample
					samplesRendered++;
				}
			}

			if (!testMode)
			{
				if (!colourise)
				{
					// store saturated final colour value in image buffer
					//ADDITION : The thread or threadcount??????
					*out++ = output.convertToPixel(scene.exposure);
				}
				else
				{
					// store saturated final colour value in image buffer
					// TODO: with multiple threads this should tint the rendered output based on the thread number
					*out++ = output.convertToPixel(scene.exposure);
				}
			}
			else
			{
				// store white in image buffer 
				// TODO: with multiple threads this should store a grey based on the thread number
				*out++ = Colour(1, 1, 1).convertToPixel();
			}
		}
	}

	return samplesRendered;
}

// ADDITION : A THREAD_START_ROUTINE function that casts its argument
// calls render function to add parameter
// then exits
DWORD __stdcall rayTraceThreadStart(LPVOID threadData) {

	//cast a pointer to void to threaddata we can use
	ThreadData* data = (ThreadData*)threadData;

	//Pass in the parameter to render
	render(data->scene, data->width, data->height, data->aaLevel, data->debugProgress,
		data->testMode, data->colourise, data->outputStart, data->yPosOffset);

	ExitThread(NULL);
}
//ADDITION : 
void genThreading(Scene& scene, const int width, const int height, const int aaLevel, bool debugProgress, bool testMode, bool colourise, unsigned int threads, unsigned int* out)
{
	HANDLE* threadHandles = new HANDLE[threads];
	ThreadData* threadData = new ThreadData[threads];
	unsigned int threadHeight = (height / threads) - (height / threads) % 2; //The height of most threads.
	unsigned int oddLine = height - threadHeight * threads;
	unsigned int threadID;
	for (threadID = 0; threadID < threads - 1; threadID++) {

		threadData[threadID].scene = scene;
		threadData[threadID].threadID = threadID;
		threadData[threadID].width = width;
		threadData[threadID].height = threadHeight;
		threadData[threadID].aaLevel = aaLevel;
		threadData[threadID].debugProgress = debugProgress;
		threadData[threadID].testMode = testMode;
		threadData[threadID].colourise = colourise;
		threadData[threadID].outputStart = out + (long long unsigned int) threadID * threadHeight * (long long unsigned int) width;
		threadData[threadID].yPosOffset = threadHeight * (threadID - threads / 2); //sqrt(5) is even better but I have no idea why. I just cannot get it centred 
		//Create a thread and store the returned HANDLE
		threadHandles[threadID] = CreateThread(NULL, 0, rayTraceThreadStart, &threadData[threadID], 0, NULL);
	}
	threadData[threadID].scene = scene;
	threadData[threadID].threadID = threadID;
	threadData[threadID].width = width;
	threadData[threadID].height = threadHeight + oddLine;
	threadData[threadID].aaLevel = aaLevel;
	threadData[threadID].debugProgress = debugProgress;
	threadData[threadID].testMode = testMode;
	threadData[threadID].colourise = colourise;
	threadData[threadID].outputStart = out + (long long unsigned int) threadID * threadHeight * (long long unsigned int) width;
	threadData[threadID].yPosOffset = threadHeight * (threadID - threads / 2) + oddLine / 2;
	//Create a thread and store the returned HANDLE
	threadHandles[threadID] = CreateThread(NULL, 0, rayTraceThreadStart, &threadData[threadID], 0, NULL);

	//Wait for all the Threads to finish

	for (unsigned int i = 0; i < threads; i++)
	{
		if (threadHandles[i] != 0) {
			WaitForMultipleObjects(threads,threadHandles,TRUE, INFINITE);
		}
	}

	//Delete the arrays
	delete[] threadHandles;
	delete[] threadData;
}


// read command line arguments, render, and write out BMP file
int main(int argc, char* argv[])
{
	int width = 1024;
	int height = 1024;
	int samples = 1;

	// rendering options
	int times = 1;
	bool debugProgress = false;
	bool testMode = false;
	bool colourise = false;
	unsigned int threads = 1;			// currently unused
	unsigned int blockSize = -1;		// currently unused

	// default input / output filenames
	const char* inputFilename = "Scenes/all.txt";

	char outputFilenameBuffer[1000];
	char* outputFilename = outputFilenameBuffer;

	// do stuff with command line args
	for (int i = 1; i < argc; i++)
	{
		if (strcmp(argv[i], "-size") == 0)
		{
			width = atoi(argv[++i]);
			height = atoi(argv[++i]);
		}
		else if (strcmp(argv[i], "-samples") == 0)
		{
			samples = atoi(argv[++i]);
		}
		else if (strcmp(argv[i], "-input") == 0)
		{
			inputFilename = argv[++i];
		}
		else if (strcmp(argv[i], "-output") == 0)
		{
			outputFilename = argv[++i];
		}
		else if (strcmp(argv[i], "-runs") == 0)
		{
			times = atoi(argv[++i]);
		}
		else if (strcmp(argv[i], "-threads") == 0)
		{
			threads = atoi(argv[++i]);
		}
		else if (strcmp(argv[i], "-colourise") == 0)
		{
			colourise = true;
		}
		else if (strcmp(argv[i], "-blockSize") == 0)
		{
			blockSize = atoi(argv[++i]);
		}
		else if (strcmp(argv[i], "-debugProgress") == 0)
		{
			debugProgress = true;
		}
		else if (strcmp(argv[i], "-testMode") == 0)
		{
			testMode = true;
		}
		else
		{
			fprintf(stderr, "unknown argument: %s\n", argv[i]);
		}
	}

	// nasty (and fragile) kludge to make an ok-ish default output filename (can be overriden with "-output" command line option)
	sprintf(outputFilenameBuffer, "Outputs/%s_%dx%dx%d_%s.bmp", (strrchr(inputFilename, '/') + 1), width, height, samples, (strrchr(argv[0], '\\') + 1));

	// read scene file
	if (!init(inputFilename, scene))
	{
		fprintf(stderr, "Failure when reading the Scene file.\n");
		return -1;
	}

	// total time taken to render all runs (used to calculate average)
	int totalTime = 0;
	//int samplesRendered = 0; // SUBTRACTION : samplesRendered is now global
	for (int i = 0; i < times; i++)
	{
		Timer timer;																						// create timer
		genThreading(scene, width, height, samples, debugProgress, testMode, colourise, threads, buffer);							// raytrace scene  //ADDITION: genThreading buffer
		//samplesRendered = render(scene, width, height, samples, debugProgress, testMode, colourise, buffer);				// raytrace scene
		timer.end();																						// record end time
		totalTime += timer.getMilliseconds();																// record total time taken
	}

	// output timing information (times run and average)
	printf("rendered %d samples, average time taken (%d run(s)): %ums\n", samplesRendered, times, totalTime / times);

	// output BMP file
	write_bmp(outputFilename, buffer, width, height, width);
}
