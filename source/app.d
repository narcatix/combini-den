import std.stdio;

import kufw;

import bindbc.sdl;
import bindbc.bgfx;

private bool runMainLoop = true;
ulong fpsLimit = 60;

void main(){
	// Never delete this
	scope(exit) writeln("New high score!");
	
	// Create SDL session and initialise it with video and audio.
	SDLSession sdlSession = new SDLSession(SDL_INIT_VIDEO | SDL_INIT_AUDIO);
	scope(exit) sdlSession.destroy();
	
	// Create new window with a set size
	KUWindow window = new KUWindow("Talk to Den");
	scope(exit) window.destroy();
	
	// Create a BGFX session
	BgfxSession bgfxSession = new BgfxSession(window.size, window);
	scope(exit) bgfxSession.destroy();
	
	// Main loop
	while(runMainLoop){
		// Frame limiting
		waitForFrame(fpsLimit);
		frame++;
		
		// Input handling
		SDL_Event event;
		while(SDL_PollEvent(&event)){
			switch(event.type){
				case SDL_QUIT: quit(); break;
				default: break;
			}
		}
		
		
	}
}

void quit() @nogc nothrow @safe{
	runMainLoop = false;
}