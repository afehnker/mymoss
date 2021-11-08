import processing.sound.*;

//The sound manager is used to play and stop songs

class SoundManager {
  final Song[] songs;
  //This is how long each song will last in the game (in seconds)
  final int songDurationLimit = 60;
  
  //Holds the value of the current song being played
  Song currentSong;

  SoundManager(Song[] newSongs) {
    //recieves array of Songs at start of new game
    songs = newSongs;
    playSong();
  }
    
  boolean isPlayingSong () {
    //returns true if song is playing
    return currentSong.song.isPlaying();
  }
  
  int playSong () {
    //checks if soundmanager has songs, to avoid a NULL point exceptor
    if (hasSongs()) {
      //gets a random song
      currentSong = getRandomSong();
      //plays song, setting its duration
      currentSong.song.playFor(songDurationLimit);
      //sets amplitude to 0.1, to keep volume low
      currentSong.song.amp(0.1);
      return currentSong.tempo;
    }
    return 1000;
  }
  
  boolean hasSongs () {
    //returns true if Song array has at least 1 song in it
    return songs.length > 0;
  }
  
  Song getRandomSong() {
    //returns a random song in the songs array
    return songs[floor(random(0, songs.length - 0.01))];
  }
  
  void stopPlayingSong (){
    //Checks if there is a song playing
    if(currentSong != null && currentSong.song.isPlaying()){
      //stops the song
      currentSong.song.stop();
    }
  }
}
