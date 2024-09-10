/// @description Initialize some variables

hp = 3;
max_hp = 3;
sapphires = 0;
//window_set_fullscreen(true);


display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

gpu_set_texfilter(false);
//Start the music
audio_play_sound(a_title, 10, false);

//Get rid of course
window_set_cursor(cr_none);

//Randomize it up
randomize();