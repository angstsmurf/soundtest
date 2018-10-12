"Sound Test"

The story headline is "Not a game".

Include Glulx Entry Points by Emily Short.

Use direct event handling.

[The sound channel kind is a proxy for real, Glk level sound channels. When the story begins only two Glk channels are created, the "built-in" foreground channel and background channel, which are assigned as sound channels with index 1 and 2 respectively.]

A sound channel is a kind of thing. There are 100 sound channels.

The current sound channel is a sound channel that varies.

Sound of AIFF is the file "wind.aiff".
Sound of MOD is the file "stranger_-_run.mod".
Sound of OGG is the file "Cool-Adventure-Intro.ogg".

[The Table of Sound-Channels is a way to simplify keeping track of all the sound channels. The index of a sound channel always corresponds to its row in this table.]

Table of Sound-Channels
chan (a sound channel)
with 100 blank rows

[The current channel id is always the same as the channel id of the current sound channel. Its main use is to simplify code at the Inform 6 level]

The current channel id is a number that varies. The current channel id variable translates into I6 as "current_channel".

[The two global variables below are used to keep track of channels included ina a glk_schannel_play_multi() command.]
Multinotification is a number that varies. Multinotification is initially 101.

Multiplay channels remaining is a number that varies. Multiplay channels remaining is initially 0.

Include (-

Global current_channel = 1;

Array multi_chanarray --> 100;
Array multi_soundarray --> 100;

-) after "Definitions.i6t".

The Sound Stage is a room.

The description of the Sound Stage is "This is a mixer room with lots of buttons and controls. Most prominent is a large PLAY button, accompanied by the usual PAUSE and STOP buttons, and a volume control. There is also a switch for sound type (set to play [sound-type-name of the channel-sound of current sound channel]), and another one to change the sound channel, currently set to [index of current sound channel].[paragraph break]Furthermore you notice a DESTROY button, a HINT button, [if simplify button is in location]a SIMPLIFY button, a PLAY MULTI button and a volume change delay control[otherwise]and a COMPLICATE button[end if]."

The large display is fixed in place in Sound Stage. The initial appearance of the large display is "There is also a large display here reading: 'Open sound channels: [open-channels-list]. Currently playing: [playing-channels-list]'.[if multiplay channels remaining is greater than 1] (Channels that are part of a multichannel play command will be listed even if they have finished.)"

To say open-channels-list:
	if there is a sound channel which is not uncreated:
		let L be a list of sound channels;
		repeat through Table of Sound-Channels:
			unless chan entry is uncreated:
				add chan entry to L;
		say "[L]";
	otherwise:
		say "none".

To say playing-channels-list:
	if there is a sound channel which is playing:
		let L be a list of sound channels;
		repeat through Table of Sound-Channels:
			if chan entry is playing:
				add chan entry to L;
		say "[L]";
	otherwise:
		say "none".

First when play begins:
	say "Welcome to the Sound Test![paragraph break]The Ogg Vorbis file included in this test is 'Cool Adventure Intro' by Eric Matyas. See www.soundimage.org[line break]The MOD file is 'Run' by Stranger. See modarchive.org[line break]The AIFF file is taken from the Glulx test game 'Sensory Jam' by Andrew Plotkin. See eblong.com/zarf/glulx/[paragraph break]".

When play begins:
	unless glulx sound is supported:
		say "This interpreter is unable to play sounds, so nothing in this test suite will work. You can type yes to go ahead and run it anyway, but it is not recommended.[paragraph break]>> ";
		unless the player consents:
			end the story abruptly;
	otherwise:
		unless glulx sounds are fully supported:
			say "A hollow voice says: 'This interpreter only has basic sound support.' The PLAY MULTI button and the volume change delay control disappear in a puff of smoke. [bracket]You can reinstate them with the COMPLICATE button, but they probably won't work.[close bracket]";
	let N be 1;
	let R be -1 + the rock of channel id (foreground channel id);
	repeat with S running through sound channels:
		choose row N from the Table of Sound-Channels;
		now the chan entry is S;
		now the index of S is N;
		now the notification of S is N;
		now the rock of S is R + N;
		increment N;
	now current sound channel is chan in row 1 of the Table of Sound-Channels;
	now current channel id is foreground channel id;
	now channel id of current sound channel is current channel id;
	[say "Set channel 1 (and current sound channel) to foreground channel, id [channel id of current sound channel] and rock [rock of channel id (foreground channel id)].";]
	let BGC be chan in row 2 of the Table of Sound-Channels;
	now the channel id of BGC is background channel id;
	[say "Set channel 2 to background channel, id [background channel id] and rock [rock of channel id (background channel id)].";]
	recover sound channels.

[A hack to always run some code after a successful restore]
restore the game rule response (B) is "[post-restore routine]";

 To say post-restore routine:
 	say "Ok. ";
	recover sound channels;
	recreate sound channels.

To recover sound channels:
	let C be the channel following 0;
	while C is not 0:
		[say "Found a channel with id [C] and rock [rock of channel id C].";]
		repeat with C2 running through sound channels:
			if rock of C2 is rock of channel id C:
				now channel id of C2 is C;
				[say "Added it at index [index of C2].";]
				now C2 is stopped;
		now C is the channel following C;

To recreate sound channels:
	repeat with C running through sound channels which are not uncreated:
		let found be false;
		let C2 be the channel following 0;
		while C2 is not 0:
			if rock of C is rock of channel id C2:
				now found is true;
			now C2 is the channel following C2;
		if found is false:
			now channel id of C is new channel with rock (rock of C);
			[say "Created a new channel at index [index of C] with id [channel id of C] and rock [rock of C].";]

To end the story abruptly:
	(- VM_KeyChar(); quit; -)

To decide which number is foreground channel id:
	(- gg_foregroundchan -).

To decide which number is background channel id:
	(- gg_backgroundchan -).

To decide which number is the rock of channel id (N - a number):
	(- glk_schannel_get_rock({N}) -).

To decide which number is the channel following (N - a number):
	(- glk_schannel_iterate({N}, 0) -).

Chapter 1 - Components of the channel kind

A sound channel has a number called the channel id. The channel id of a sound channel is usually 0.

A sound channel has a number called the rock. The rock of a sound channel is usually 0. A sound channel has a number called the index.

The printed name of a sound channel is "[index of the item described]".

A sound channel has a number called the volume. The volume of a sound channel is usually 65536.

A sound channel has a number called repeats. The repeats of a sound channel is usually 1.

A sound channel has a number called volume change delay. The volume change delay of a sound channel is usually 0.

A sound channel has a number called notification. The notification of a sound channel is usually 1.

A sound channel has a sound name called channel-sound. The channel-sound of a sound channel is usually sound of AIFF.

A sound channel has a number called multiplay index. The multiplay index of a sound channel is usually 0.

A sound channel can be uncreated, stopped, playing or paused. A sound channel is usually uncreated.

The description of a sound channel is "Sound channel [index of the item described] is set to play [sound-type-name of the channel-sound of the item described] at volume [the volume of the item described] with [repeats of the item described] repeat[s] and notification number [notification of the item described]."

To say sound-type-name of (N – a sound name):
	if N is:
		-- sound of AIFF:
			say "aiff";
		-- sound of MOD:
			say "mod";
		-- sound of OGG:
			say "ogg".

Chapter 2 - Interactive parts

Section 1 - Numeric sliders

The channel knob is scenery in Sound Stage. The description is  "A turning control with which to set the number of the current channel. It can be set to any integer between 1 and 100. It is currently set to [index of current sound channel]."

Understand "sound channel" and "sound/-- channel control" as the channel knob.

The volume slider is scenery in Sound Stage. The description is "A slide control with which to adjust the volume of the current channel. It is numbered from 0 to 65535. Currently it is set to [the volume of current sound channel]."

Understand "volume control/level" as the volume slider.

The fade delay slider is scenery in Sound Stage. The description is "A slide control with which to adjust the duration of a volume change. It is currently set to [volume change delay of current sound channel]."

Understand "fade/fader delay/-- slider/control/--"  or "volume change/-- delay" as the fade delay slider.

The repeats knob is scenery in Sound Stage. The description is "A turning control with which to set the number of repeats for a sound, which can be set to any integer between -1 and 65535. It is currently set to [repeats of current sound channel]."

Understand "repeat/repeats/loop/loops/repetitions knob/control/--" as the repeats knob.

The notification switch is scenery in Sound Stage. The description is "A switch for turning on and off sound notifications. It is currently [if notification of current sound channel is 0]off[otherwise]on[end if]."

Understand "notification/notify/notifications knob/control/switch/-- " as the notification switch.

The type switch is scenery in Sound Stage. The description is "A turning control with which to change the sound played. It can be set to AIFF, MOD or OGG. It is currently set to [sound-type-name of channel-sound of current sound channel]."

Understand "sound type/--" as the type switch.

Section 2 - Buttons

The play button is scenery in Sound Stage. The description is "This button will start playback of the current channel."

Instead of pushing the play button:
	try playing.

The multiplay button is scenery in Sound Stage. The description is "This button will start playback of all existing channels, using the current settings."

Instead of pushing the multiplay button:
	try multiplaying.

The pause button is scenery in Sound Stage. The description is "This button will pause playback of the current channel."

Instead of pushing the pause button:
	try pausing.

The stop button is scenery in Sound Stage. The description is "This button will stop playback of the current channel."

Instead of pushing the stop button:
	try stopping.

The destroy button is scenery in Sound Stage. The description is "This button will destroy the current sound channel."

Understand "destruction" and "self-destruct" and "self/-- destruct" as the destroy button.

Instead of pushing the destroy button:
	try self-destructing.

The simplify button is scenery in Sound Stage. The description is "This button will switch to basic sound functionality."

Instead of pushing the simplify button:
	try simplifying.

The complicate button is scenery in Sound Stage. The description is "This button will switch to complete sound functionality."

Instead of pushing the complicate button:
	try complicating.

The hint button is scenery in Sound Stage. The description is "This button will test the  glk_sound_load_hint function."

Instead of pushing the hint button:
	try hinting.

Chapter 3 - I6 glue

To play (SFX - sound name) with (R - a number) repeats/repeat and notification (N - a number):
	(- glk_schannel_play_ext( current_channel, ResourceIDsOfSounds-->{SFX}, {R}, {N}); -).

To volume-adjust to (N - a number):
	(- glk_schannel_set_volume(current_channel, {N}); -).

To volume-adjust to (X - a number) with a duration of (Y - a number) and notification (N - a number):
	(- glk_schannel_set_volume_ext(current_channel, {X}, {Y}, {N}); -).

To stop sound:
	(- glk_schannel_stop(current_channel); -).

To pause sound:
	(- glk_schannel_pause(current_channel); -).

To unpause sound:
	(- glk_schannel_unpause(current_channel); -).

To multiplay sound:
	let N be 0;
	let L be a list of sound channels;
	repeat through Table of Sound-Channels:
		unless the chan entry is uncreated:
			add chan entry to L;
			now multiplay index of chan entry is multinotification;
			add multisound chan entry at N;
			increment N;
	if N is greater than 0:
		let R be multiplay result with N channels and notify (multinotification);
		say "Tried to simultaneously start playback on [regarding the number of entries in L]channel[s] [L].";
		now multiplay channels remaining is R;
		say "Successfully started playing [R] channel[s].";

To add multisound (S - a sound channel) at (N - a number):
	(- multi_chanarray --> {N} = {S}.(+ channel id +); multi_soundarray --> {N} = ResourceIDsOfSounds --> {S}.(+ channel-sound +); -).

To decide which number is multiplay result with (C - a number) channels and notify (N - a number):
	(- glk_schannel_play_multi(multi_chanarray, {C}, multi_soundarray,  {C}, {N}); -).

To decide which number is new channel with rock (R - a number) and volume (V - a number):
	(-  glk_schannel_create_ext({R}, {V}) -).

To decide which number is new channel with rock (R - a number):
	(-  glk_schannel_create({R}) -).

To destroy channel (C - a number):
	(- glk_schannel_destroy({C}); -).

To sound load hint:
	(- glk_sound_load_hint(ResourceIDsOfSounds-->(+ sound of AIFF +), 1); -).


Chapter 4 - Actions

Section 1 - Pushing buttons

Understand "play" as playing. Playing is an action applying to nothing.
Carry out playing:
	say "You push the play button. Sound channel [current sound channel] begins to play the [sound-type-name of channel-sound of current sound channel] with [repeats of current sound channel] repetitions and notification number [notification of current sound channel].";
	now the current sound channel is playing;
	play (channel-sound of current sound channel) with (repeats of current sound channel) repeats and notification (notification of current sound channel).

Understand "multiplay" or "play multi/multiple" or "multi" or "multiple" as multiplaying. Multiplaying is an action applying to nothing.
Carry out multiplaying:
	say "You push the multiplay button.";
	multiplay sound.

Understand "stop" as stopping. Stopping is an action applying to nothing.
Carry out stopping:
	say "Channel [current sound channel] stopped.";
	now the current sound channel is stopped;
	stop sound.

Understand "pause" as pausing. Pausing is an action applying to nothing.
Carry out pausing:
	say "Channel [current sound channel] paused.";
	now the current sound channel is paused;
	pause sound.

Understand "resume" as unpausing. Unpausing is an action applying to nothing.
Carry out unpausing:
	say "Channel [current sound channel] resumed.";
	now the current sound channel is playing;
	unpause sound.

Understand "destroy" as self-destructing. Self-destructing is an action applying to nothing. Carry out self-destructing:
	if the index of current sound channel is 1:
		say "To simplify things, channel 1 cannot be destroyed.";
		stop the action;
	destroy channel (channel id of current sound channel);
	say "Channel [current sound channel] destroyed.";
	now the current sound channel is uncreated;
	try number-setting channel knob to 1.

Understand "destroy channel/-- [number]" as channel-destructing. Channel-destructing is an action applying to one number. Carry out channel-destructing:
	try number-setting channel knob to the number understood;
	try self-destructing.

Understand "simplify" as simplifying. Simplifying is an action applying to nothing. Carry out simplifying:
	say "Basic sound functionality only.";

Understand "complicate" as complicating. Complicating is an action applying to nothing. Carry out complicating:
	say "Complete sound functionality.";

Understand "hint" as hinting. Hinting is an action applying to nothing. Carry out hinting:
	sound load hint;
	say "Called glk_sound_load_hint( Sound of AIFF, 1).";

Section 2 - Switching sound type

Understand "aiff" as aiffing.  Aiffing is an action applying to nothing. Carry out aiffing:
	if the channel-sound of current sound channel is sound of AIFF:
		say "The current sound channel is already set to play AIFF.";
	otherwise:
		now the channel-sound of current sound channel is sound of AIFF;
		say "You set the sound type to AIFF."

Understand "mod" as modding.  Modding is an action applying to nothing. Carry out modding:
	if the channel-sound of current sound channel is sound of MOD:
		say "The current sound channel is already set to play MOD.";
	otherwise:
		now the channel-sound of current sound channel is sound of MOD;
		say "You set the sound type to MOD."

Understand "ogg" as ogging.  Ogging is an action applying to nothing. Carry out ogging:
	if the channel-sound of current sound channel is sound of OGG:
		say "The current sound channel is already set to play OGG.";
	otherwise:
		now the channel-sound of current sound channel is sound of OGG;
		say "You set the sound type to OGG."

A sound type is a kind of value. The sound types are aiff, mod and ogg.

Understand "set [type switch] to [sound type]"  as soundtype-setting it to. Soundtype-setting it to is an action applying to a thing and a sound type. Carry out soundtype-setting it to:
	if the sound type understood is:
		-- aiff:
			try aiffing;
		-- mod:
			try modding;
		-- ogg:
			try ogging.

Section 2 - Changing numeric sliders

Understand "set [something] to [number]" as number-setting it to. Number-setting it to is an action applying to one thing and one number. Carry out number-setting it to:
	if the noun is:
		-- the channel knob:
			if the index of current sound channel is the number understood:
				say "[The noun] is already set to [the number understood].";
				stop the action;
			now the current sound channel is the chan in row (the number understood)  of the Table of Sound-Channels;
			now current channel id is the channel id of current sound channel;
			if the current sound channel is uncreated:
				if glulx sounds are fully supported:
					now the channel id of current sound channel is new channel with rock (rock of current sound channel) and volume (volume of current sound channel);
				otherwise:
					now the channel id of current sound channel is new channel with rock (rock of current sound channel);
				unless the channel id of current sound channel is 0:
					now the current sound channel is stopped;
					now the current channel id is the channel id of current sound channel;
					now the rock of current sound channel is the rock of channel id (current channel id);
					say "Created new sound channel with id [channel id of current sound channel] and rock [rock of current sound channel].";
				otherwise:
					say "[bracket]Something went wrong. Could not create channel [current sound channel]. All kinds of things are likely to break.[close bracket][paragraph break]";
		-- the volume slider:
			if the volume of current sound channel is the number understood:
				say "[The noun] is already set to [the number understood].";
				stop the action;
			if the number understood is less than 0 or the number understood is greater than 65536:
				say "The volume slider is numbered from 0 to 65536.";
				stop the action;
			now the volume of current sound channel is the number understood;
			volume-adjust to the number understood with a duration of (volume change delay of the current sound channel) and notification (notification of the current sound channel);
		-- the repeats knob:
			if the repeats of current sound channel is the number understood:
				say "[The noun] is already set to [the number understood].";
				stop the action;
			now the repeats of current sound channel is the number understood;
		-- the fade delay slider:
			if the volume change delay of current sound channel is the number understood:
				say "[The noun] is already set to [the number understood].";
				stop the action;
			now the volume change delay of current sound channel is the number understood;
		--  the notification switch:
			if the notification of current sound channel is the number understood:
				say "[The noun] is already set to [the number understood].";
				stop the action;
			now the notification of current sound channel is the number understood;
	say "You set [the noun] to [the number understood]."

Understand "set volume to max" or "max volume" as volume-maxing. Volume-maxing is an action applying to nothing. Carry out volume-maxing:
	try number-setting the volume slider to 65536.

Understand the command "switch" as something new. Understand the command "turn" as something new.

Understand the command "switch" as "set".
Understand the command "turn" as "set".

Section 3 - Convenience actions, looping and fading

Understand "play [sound type]" as type-playing. Type-playing is an action applying to one sound type. Carry out type-playing:
	try soundtype-setting type switch to the sound type understood;
	try playing.

Understand "loop [sound type] forever/--" or "repeat [sound type] forever/--" as forever-looping. Forever-looping is an action applying to one sound type. Carry out forever-looping:
	try soundtype-setting type switch to the sound type understood;
	try number-setting repeats knob to -1;
	if volume of the current sound channel is 0:
		try number-setting volume to 65536;
	try playing instead.

Understand "loop [number] times/--" or "repeat [number] times/--" or "play [number] times/--" as looping. Looping is an action applying to one number. Carry out looping:
	try number-setting repeats knob to the number understood;
	if volume of the current sound channel is 0:
		try number-setting volume to 65536;
	try playing instead.

Understand "loop forever/--" or "repeat forever/--" as vaguely looping. Vaguely looping is an action applying to nothing. Carry out vaguely looping:
	try number-setting repeats knob to -1;
	if volume of the current sound channel is 0:
		try number-setting volume to 65536;
	try playing instead.

Understand "fade to/-- [number]" as volume-fading to. Volume-fading to is an action applying to one number. Carry out volume-fading to:
	if the volume change delay of the current sound channel is 0:
		try number-setting the fade delay slider to 2000;
	try number-setting volume to the number understood;

Understand "fade out/--" as vaguely fading. Vaguely fading is an action applying to nothing. Carry out vaguely fading:
		try volume-fading to 0 instead.

Chapter 5 - Handle sound notifications

To restart line input in the/-- main window:
	(- glk_request_line_event(gg_mainwin, buffer+WORDSIZE, INPUT_BUFFER_LEN-WORDSIZE, 0); -)

Glulx input handling rule for a volume-event:
	cancel line input in the main window;
	say "[bracket]Volume notification: A volume change was completed on channel [glk event value 2].[close bracket][line break]>";
	restart line input in the main window.

Glulx input handling rule for a sound-notify-event:
	cancel line input in the main window;
	let N be glk event value 2;
	if N is multinotification:
		decrement multiplay channels remaining;
		say "[bracket]Sound notification: A sound finished playing. It was part of a multichannel play command. [if multiplay channels remaining is greater than 0]There [regarding multiplay channels remaining][are] [multiplay channels remaining] channel[s] still playing as part of this command[otherwise]That was the last channel, the multichannel command is concluded[end if].[close bracket][line break]>";
		if multiplay channels remaining is less than 1:
			repeat through the Table of Sound-Channels:
				if the multiplay index of chan entry is multinotification:
					now multiplay index of chan entry is 0;
					now the chan entry is stopped;
	otherwise:
		say "[bracket]Sound notification: A sound finished playing on channel [N].[close bracket][line break]>";
		let C be the chan in row N of the Table of Sound-Channels;
		now C is stopped;
	restart line input in the main window.
