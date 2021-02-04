package code.utils;

/**
 *
 * @author Roman Lahin
 */
public class FPS {
    
    public static int frameTime; //FPS sync and stuff
    public static long previousFrame; 
    public static long lastFpsTest; //Last fps test(fps should update every 1000ms)
    public static int frames; //Frames in second counter
    public static int currentTime; //Frames in second counter
    public static int fps; //Frames per second

    
    public static void reset() {
        lastFpsTest = System.currentTimeMillis();
        currentTime = frames = fps = 0;
        lastFpsTest = previousFrame = 0;
        frameTime = 15;
    }
    
    public static void miniReset() {
        lastFpsTest = previousFrame = 0;
        frames = 30; //maybe?
    }
    
    public static void frame() {
        if(previousFrame!=0) frameTime = (int) (System.currentTimeMillis() - previousFrame);
        previousFrame = System.currentTimeMillis();
        
        frames++;
        currentTime+=frameTime;
        
        if(previousFrame-lastFpsTest>=1000) { //Fps meter
            fps=frames; frames=0; lastFpsTest=previousFrame;
        }
    }
    
}
