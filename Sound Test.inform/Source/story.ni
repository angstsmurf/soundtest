"Sound Test"

The story headline is "Not a game".

Include Glulx Entry Points by Emily Short.

Use direct event handling.

Sound of AIFF is the file "wind.aiff".
Sound of MOD is the file "stranger_-_run.mod".
Sound of OGG is the file "Cool-Adventure-Intro.ogg".

The Sound Stage is a room.

Volume 1 - Components of the sound channel kind

[The sound channel kind is a proxy for real, Glk level sound channels. When the story begins only two Glk channels are created, the "built-in" foreground channel and background channel, which are assigned as sound channels with index 1 and 2 respectively.]

A sound channel is a kind of thing. There are 100 sound channels.

The current sound channel is a sound channel that varies.

[The Table of Sound-Channels is a way to simplify keeping track of all sound channels. The index of a sound channel always corresponds to its row in this table.]

Table of Sound-Channels
chan (a sound channel)
with 100 blank rows

[The current channel id is always the same as the channel id of the current sound channel. Its main use is to simplify code at the Inform 6 level]

The current channel id is a number that varies. The current channel id variable translates into I6 as "current_channel".

Include (-

Global current_channel = 1;

-) after "Definitions.i6t".

A sound channel has a number called the channel id. The channel id of a sound channel is usually 0.

A sound channel has a number called the rock. The rock of a sound channel is usually 0. A sound channel has a number called the index.

The printed name of a sound channel is "[index of the item described]".

A sound channel has a number called the volume. The volume of a sound channel is usually 65536.

A sound channel has a number called repeats. The repeats of a sound channel is usually 1.

A sound channel has a number called volume change delay. The volume change delay of a sound channel is usually 0.

A sound channel has a number called notification. The notification of a sound channel is usually 1.

A sound channel has a sound name called channel-sound. The channel-sound of a sound channel is usually sound of AIFF.

A sound channel has a truth state called multiplay state. The multiplay state of a sound channel is usually false.

A sound channel can be uncreated, stopped, playing or paused. A sound channel is usually uncreated.

The description of a sound channel is "Sound channel [index of the item described] [if the item described is uncreated]has not been created yet. You can create a sound channel simply by setting the channel switch to its number[otherwise]is set to play [sound-type-name of the channel-sound of the item described] at volume [the volume of the item described] with [repeats of the item described] repetition[s] and notification number [notification of the item described]. It is currently [status of the item described][end if][if the multiplay state of the item described is true]. This channel seems to be part of a play multi command[end if]."

To say sound-type-name of (N – a sound name):
	if N is:
		-- sound of AIFF:
			say "AIFF";
		-- sound of MOD:
			say "MOD";
		-- sound of OGG:
			say "OGG".

To say status of (C – a sound channel):
	if C is uncreated:
		say "uncreated";
	otherwise if C is playing:
		say "playing";
	otherwise if C is stopped:
		say "stopped";
	otherwise if C is paused:
		say "paused".

Volume 2 - Interactive parts

Book 1 - Numeric sliders

The channel knob is scenery in Sound Stage. The description is  "A turning control with which to set the number of the current channel. It can be set to any integer between 1 and 100. It is currently set to [index of current sound channel]."

Understand "sound channel" and "sound/-- channel control/switch/knob" as the channel knob.

The volume slider is scenery in Sound Stage. The description is "A slide control with which to adjust the volume of the current channel. It is numbered from 0 to 65535. Currently it is set to [the volume of current sound channel]."

Understand "volume control/level" as the volume slider.

The fade delay slider is scenery in Sound Stage. The description is "A slide control with which to adjust the duration (in milliseconds) of a volume change. It is currently set to [volume change delay of current sound channel]."

Understand "fade/fader delay/-- slider/control/--"  or "volume change/-- delay" as the fade delay slider.

The repeats knob is scenery in Sound Stage. The description is "A turning control with which to set the number of repeats for a sound, which can be set to any integer between -1 and 65535. It is currently set to [repeats of current sound channel]."

Understand "repeat/repeats/loop/loops/repetitions knob/control/--" as the repeats knob.

The notification switch is scenery in Sound Stage. The description is "A switch for turning on and off sound notifications. It is currently [if notification of current sound channel is 0]off[otherwise]on[end if]."

Understand "notification/notify/notifications knob/control/switch/-- " as the notification switch.

The type switch is scenery in Sound Stage. The description is "A turning control with which to change the sound played. It can be set to AIFF, MOD or OGG. It is currently set to [sound-type-name of channel-sound of current sound channel]."

The printed name of the type switch is "sound type switch".

Understand "sound type/--" as the type switch.

Book 2 - Buttons

The play button is scenery in Sound Stage. The description is "This button will start playback of the current channel."

Instead of pushing the play button:
	try playing.

The multiplay button is scenery in Sound Stage. The description is "This button will start playback of all existing channels, using the current settings."

Understand "play/-- multi" as the multiplay button.

Instead of pushing the multiplay button:
	try multiplaying.

The pause button is scenery in Sound Stage. The description is "This button will pause playback of the current channel."

Instead of pushing the pause button:
	try pausing.

The unpause button is scenery in Sound Stage. The description is "This button will resume playback of the current channel, if it is paused."

Instead of pushing the unpause button:
	try unpausing.

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

The complicate button is scenery. The description is "This button will switch to complete sound functionality."

Instead of pushing the complicate button:
	try complicating.

The hint button is scenery in Sound Stage. The description is "This button will test the glk_sound_load_hint function."

Instead of pushing the hint button:
	try hinting.

The simple button is scenery in Sound Stage. The description is "This button starts playing the current channel using glk_schannel_play rather than glk_schannel_play_ext, disregaring any repeats and notification settings. As the command does not support notifications, the channel will keep its 'playing' status even after it has finished."

The printed name of the simple button is "play simple button". Understand "play simple button/--" as the simple button.

Instead of pushing the simple button:
	try simple-playing.

The stop-all-button is scenery in Sound Stage. The description is "This button stops all currently playing or paused sound channels immediately. It is a convenience function which has no corresponding Glk command."

The printed name of the stop-all-button is "stop all button". Understand "stop all button/--" as the stop-all-button.

Instead of pushing the stop-all-button:
	try all-stopping.

The autotest button is scenery in Sound Stage. The description is "This button starts an automated test suite that calls every supported sound-related Glk function. You can also run the individual parts of the suite. Type TEST for the full list of commands."

Understand "auto/automatic/automated test/-- button/--" or "test button/--" as the autotest button.

Understand "play [autotest button]" as playtesting. Playtesting is an action applying to one thing. Carry out playtesting:
				try autotesting.

Instead of pushing the autotest button:
	try autotesting.

Volume 4 - Actions

Book 1 - Pushing buttons

Understand "play" as playing. Playing is an action applying to nothing.
Carry out playing:
	say "You push the play button. [run paragraph on]";
	let error be the result of playing (channel-sound of current sound channel) with (repeats of current sound channel) repeats and notification (notification of current sound channel);
	if error is 0:
		say "An error occurs! The channel did not start playing![line break]";
		stop the action;
	say "Sound channel [current sound channel] [if current sound channel is playing]stops playing its previous sound and [end if]begins to play the [sound-type-name of channel-sound of current sound channel] at volume [volume of current sound channel] with [repeats of current sound channel] repetition[s] and notification number [notification of current sound channel].";
	if the multiplay state of current sound channel is true:
		handle multichannel stopped;
		now multiplay state of current sound channel is false;
	now the current sound channel is playing;

Understand "play simple" or "simple-play" or "simple" as simple-playing. Simple-playing is an action applying to nothing. Carry out simple-playing:
	say "You push the play simple button. [run paragraph on]";
	let error be the result of playing (channel-sound of current sound channel);
	if error is 0:
		say "An error occurs! The channel did not start playing![line break]";
		stop the action;
	say "Sound channel [current sound channel] [if current sound channel is playing]stops playing its previous sound and [end if]begins to play the [sound-type-name of channel-sound of current sound channel]. (As the simple play command does not support notifications, this channel will keep its 'playing' status after it has finished.)";
	if the multiplay state of current sound channel is true:
		handle multichannel stopped;
		now multiplay state of current sound channel is false;
	now the current sound channel is playing;

Understand "play channel/-- [number]" as channel-playing. Channel-playing is an action applying to one number. Carry out channel-playing:
	try number-setting channel knob to the number understood;
	try playing.

Understand "stop" as stopping. Stopping is an action applying to nothing.
Carry out stopping:
	stop sound;
	if current sound channel is stopped:
		say "Current sound channel is already stopped.";
		stop the action;
	if the multiplay state of current sound channel is true:
		handle multichannel stopped;
		now multiplay state of current sound channel is false;
	say "Channel [current sound channel] stopped.";
	now the current sound channel is stopped.

Understand "stop channel/-- [number]" as channel-stopping. Channel-stopping is an action applying to one number. Carry out channel-stopping:
	try number-setting channel knob to the number understood;
	try stopping.

Understand "stop all" as all-stopping. All-stopping is an action applying to nothing. Carry out all-stopping:
	stop all channels;
	if there is a sound channel which is playing or there is a sound channel which is paused:
		repeat through Table of Sound-Channels:
			if chan entry is playing or chan entry is paused:
				now chan entry is stopped;
				if the multiplay state of chan entry is true:
					handle multichannel stopped;
					now multiplay state of chan entry is false;
				say "Stopped sound channel [chan entry].";
	otherwise:
		say "There are no playing or paused sound channels."

Understand "pause" as pausing. Pausing is an action applying to nothing.
Carry out pausing:
	if the pause button is not in location:
		say "The pause button has disappeared.";
		stop the action;
	if current sound channel is paused:
		say "Current sound channel is already paused.";
		stop the action;
	say "Channel [current sound channel] paused.";
	now the current sound channel is paused;
	pause sound.

Understand "pause channel/-- [number]" as channel-pausing. Channel-pausing is an action applying to one number. Carry out channel-pausing:
	try number-setting channel knob to the number understood;
	try pausing.

Understand "resume" as unpausing. Unpausing is an action applying to nothing.
Carry out unpausing:
	if the unpause button is not in location:
		say "The resume button has disappeared.";
		stop the action;
	if current sound channel is not paused:
		say "Current sound channel is not paused.";
		stop the action;
	say "Channel [current sound channel] resumed.";
	now the current sound channel is playing;
	unpause sound.

Understand "resume channel/-- [number]" as channel-unpausing. Channel-unpausing is an action applying to one number. Carry out channel-unpausing:
	try number-setting channel knob to the number understood;
	try unpausing.

Understand the command "unpause" as "resume".

Understand "destroy" as self-destructing. Self-destructing is an action applying to nothing. Carry out self-destructing:
	if the index of current sound channel is 1:
		say "To simplify things, channel 1 cannot be destroyed.";
		stop the action;
	destroy channel (channel id of current sound channel);
	say "Channel [current sound channel] destroyed.";
	if the multiplay state of current sound channel is true:
		handle multichannel stopped;
		now multiplay state of current sound channel is false;
	now the current sound channel is uncreated;
	try number-setting channel knob to 1.

Understand "destroy channel/-- [number]" as channel-destructing. Channel-destructing is an action applying to one number. Carry out channel-destructing:
	try number-setting channel knob to the number understood;
	try self-destructing.

Understand "simplify" as simplifying. Simplifying is an action applying to nothing. Carry out simplifying:
	if the simplify button is not in location:
		say "The simplify button has disappeared.";
		stop the action;
	say "The PLAY MULTI, PAUSE, UNPAUSE and SIMPLIFY buttons disappear in a puff of smoke along with the fade delay control. In their place a COMPLICATE button appears.";
	now the simplify button is nowhere;
	now the multiplay button is nowhere;
	now the pause button is nowhere;
	now the unpause button is nowhere;
	now fade delay slider is nowhere;
	now the complicate button is in location;
	if there is a paused sound channel:
		say "For your convenience, paused channels are resumed.";
		repeat with C running through paused sound channels:
			now C is playing;
			if glulx sounds are fully supported:
				unpause channel id (channel id of C);

Understand "complicate" as complicating. Complicating is an action applying to nothing. Carry out complicating:
	if the complicate button is not in location:
		say "The complicate button has disappeared.";
		stop the action;
	say "The COMPLICATE button disappears in a puff of smoke. In its place you now see a PLAY MULTI button, a PAUSE button, an UNPAUSE button, a fade delay control and a SIMPLIFY button.";
	now the multiplay button is in location;
	now the fade delay slider is in location;
	now the simplify button is in location;
	now the pause button is in location;
	now the unpause button is in location;
	now the complicate button is nowhere.

Understand "hint" as hinting. Hinting is an action applying to nothing. Carry out hinting:
	sound load hint;
	say "Called glk_sound_load_hint( Sound of AIFF, 1 ).";

Book 2 - Multiplay

Understand "multiplay" or "play multi/multiple" or "multi" or "multiple" or "play all" as multiplaying. Multiplaying is an action applying to nothing.
Carry out multiplaying:
	if the multiplay button is not in location:
		say "The multiplay button is gone.";
		stop the action;
	say "You push the multiplay button.";
	multiplay sound.

To multiplay sound:
	if multiplay channels remaining is greater than 0:
		say "There already seems to be an active play multi command. This will be replaced by the new one, as this test unfortunately does not yet support multiple simultaneous play multi commands.";
	let N be 0;
	let L be a list of sound channels;
	repeat with C running through sound channels:
		unless C is uncreated:
			add C to L;
			now multiplay state of C is true;
			now C is playing;
			add multisound C at N;
			increment N;
	if N is greater than 0:
		let R be multiplay result with N channels and notify (multinotification);
		say "Tried to simultaneously start playback on [regarding the number of entries in L]channel[s] [L].";
		now multiplay channels remaining is R;
		say "Successfully started playing [R] channel[s].";

[The global variables below are used to keep track of channels included in a glk_schannel_play_multi() command.]

Multinotification is a number that varies. Multinotification is initially 101.

Multiplay channels remaining is a number that varies. Multiplay channels remaining is initially 0.

Include (-

Array multi_chanarray --> 100;
Array multi_soundarray --> 100;

-) after "Definitions.i6t".

Book 3 - Switching sound type

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
		unless glk mod sound is supported:
			say "[bracket]This interpreter claims to not support playing sound files in MOD format, but we'll try anyway[close bracket][line break]";
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

Book 4 - Changing numeric sliders

Understand "set [something] to [number]" as number-setting it to. Number-setting it to is an action applying to one thing and one number. Carry out number-setting it to:
	if the noun is:
		-- the channel knob:
			if the index of current sound channel is the number understood:
				say "[The noun] is already set to [the number understood].";
				stop the action;
			if the number understood is greater than 100 or the number understood is less than 1:
				say "The sound channels are numbered from 1 to 100.";
				stop the action;
			now the current sound channel is the chan in row (the number understood) of the Table of Sound-Channels;
			now current channel id is the channel id of current sound channel;
			if the current sound channel is uncreated:
				create a new sound channel;
		-- the volume slider:
			if the volume of current sound channel is the number understood:
				say "[The noun] is already set to [the number understood].";
				stop the action;
			unless glk sound volume is supported:
				say "[bracket]This interpreter claims to not support setting sound volume, but we'll try anyway[close bracket][line break]";
			if the number understood is less than 0 or the number understood is greater than 65536:
				say "The volume slider is numbered from 0 to 65536.";
				stop the action;
			now the volume of current sound channel is the number understood;
			if the simplify button is in location:
				volume-adjust to the number understood with a duration of (volume change delay of the current sound channel) and notification (notification of the current sound channel);
			otherwise:
				volume-adjust to the number understood;
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

To create a new sound channel:
	if the simplify button is in location:
		now the channel id of current sound channel is new channel with rock (rock of current sound channel) and volume (volume of current sound channel);
	otherwise:
		now the channel id of current sound channel is new channel with rock (rock of current sound channel);
	unless the channel id of current sound channel is 0:
		now the current sound channel is stopped;
		now the current channel id is the channel id of current sound channel;
		now the rock of current sound channel is the rock of channel id (current channel id);
		say "Created a new sound channel with id [channel id of current sound channel] and rock [rock of current sound channel].";
	otherwise:
		say "[bracket]Something went wrong. Could not create channel [current sound channel]. All kinds of things are likely to break.[close bracket][paragraph break]";

Understand the command "switch" as something new. Understand the command "turn" as something new.

Understand the command "switch" as "set".
Understand the command "turn" as "set".

Book 5 - Convenience actions, looping and fading

Understand "set volume to max" or "max volume" as volume-maxing. Volume-maxing is an action applying to nothing. Carry out volume-maxing:
	try number-setting the volume slider to 65536.

Understand "set volume to half" or "half volume" as volume-halfing. Volume-halfing is an action applying to nothing. Carry out volume-halfing:
	try number-setting the volume slider to 32768.

Understand "[number]" or "channel [number]" or "sound channel [number]" as channelling. Channelling is an action applying to one number. Carry out channelling:
	try number-setting the channel knob to the number understood.

Understand "examine sound/-- channel/-- [number]" or "look at/-- sound/-- channel/-- [number]" as channel-examining. Channel-examining is an action applying to one number. Carry out channel-examining:
	if the number understood is greater than 100 or the number understood is less than 1:
		say "The sound channels are numbered from 1 to 100.";
		stop the action;
	let C be the chan in row (the number understood) of the Table of Sound-Channels;
	say "[description of C][line break]".

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

Understand "fade out/--" as vaguely fading out. Vaguely fading out is an action applying to nothing. Carry out vaguely fading out:
		try volume-fading to 0 instead.

Understand "fade in/--" as vaguely fading in. Vaguely fading in is an action applying to nothing. Carry out vaguely fading in:
		try volume-fading to 65536 instead.

Volume 5 - Describing the room

The description of the Sound Stage is "This is a mixer room full of different controls. Most prominent is a large PLAY button, accompanied by the usual PAUSE and STOP buttons, and a volume control. There is also a switch for sound type (set to play [sound-type-name of the channel-sound of current sound channel]), and another one to change the sound channel, currently set to [index of current sound channel].[paragraph break]Furthermore, you notice an AUTOTEST button, a DESTROY button, a HINT button, [if the simplify button is in location]a SIMPLIFY button, a PLAY MULTI button and a fade delay control[otherwise]and a COMPLICATE button[end if]. You can get a full list of all available controls by typing EXAMINE CONTROLS."

The large display is fixed in place in Sound Stage. The initial appearance of the large display is "There is a large display on the wall here. [description of the large display]". The description of the large display is "It says: 'Open sound channels: [open-channels-list]. Currently playing: [playing-channels-list]'."

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
		say "[L][if multiplay channels remaining is greater than 1]. [bracket]Channels that are part of a play multi command will be listed as playing even if they have finished[close bracket][end if]";
	otherwise:
		say "none".

Understand "examine controls" or "look at/-- controls" as listing controls. Listing controls is an action applying to nothing. Carry out listing controls:
	let L be a list of things;
	repeat with item running through things in location:
		unless item is player or item is large display:
			add item to L;
	say "You can se [L with indefinite articles].[paragraph break][bracket]You can get more information about individual controls by examining them.[close bracket][line break]"

Volume 6 - Handle sound notifications

Glulx input handling rule for a volume-event:
	if test-running is true:
		handle test volume notification glk event value 2;
		the rule succeeds;
	cancel line input in the main window, preserving keystrokes;
	say "[bracket]Volume notification: A volume change was completed on channel [glk event value 2].[close bracket][line break]>";
	restart line input in the main window.

Glulx input handling rule for a sound-notify-event:
	if test-running is true:
		handle test sound notification glk event value 2;
		the rule succeeds;
	cancel line input in the main window, preserving keystrokes;
	unless glk sound notification is supported:
		say "[bracket]This interpreter claims to not support sound notifications, so something must be wrong.[close bracket][line break]";
	let N be glk event value 2;
	if N is multinotification:
		handle multichannel stopped;
	otherwise:
		say "[bracket]Sound notification: A sound finished playing on channel [N].[close bracket][paragraph break]>";
		let C be the chan in row N of the Table of Sound-Channels;
		now C is stopped;
	restart line input in the main window.

To handle multichannel stopped:
	decrement multiplay channels remaining;
	say "[bracket]A sound, which was part of a play multi command, stopped playing. [if multiplay channels remaining is greater than 0]There [regarding multiplay channels remaining][are] [multiplay channels remaining] channel[s] still playing as part of this command[otherwise]That was the last channel, the play multi command is concluded[end if].[close bracket][line break]>";
	if multiplay channels remaining is less than 1:
		repeat with C running through sound channels:
			if the multiplay state of C is true:
				now multiplay state of C is false;
				now C is stopped;

Volume 7 - Intialization

Book 1 - When play begins

First when play begins:
	say "Welcome to the Sound Test![paragraph break]The Ogg Vorbis file included in this test is 'Cool Adventure Intro' by Eric Matyas. See www.soundimage.org[line break]The MOD file is 'Run' by Stranger. See modarchive.org[line break]The AIFF file is taken from the Glulx test game 'Sensory Jam' by Andrew Plotkin. See eblong.com/zarf/glulx/[paragraph break]".

When play begins:
	check for unsupported features;
	let N be 1;
	let R be 409;
	if foreground channel id is not 0:
		now R is -1 + the rock of channel id (foreground channel id);
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
	recover sound channels;
	restore channel states.

To check for unsupported features:
	unless glulx sound is supported:
		say "This interpreter is unable to play sounds, so nothing in this test suite will work. You can type yes to go ahead and run it anyway, but it is not recommended.[paragraph break]>> ";
		unless the player consents:
			end the story abruptly;
	otherwise:
		unless glulx sounds are fully supported:
			if the simplify button is in location:
				say "A hollow voice says: 'This interpreter only provides basic sound support. Removing unsupported functions.'";
				try simplifying;
				say "[bracket]You can reinstate the advanced functions with the COMPLICATE button, but they probably won't work.[close bracket][line break]".

Book 2 - After restore

[A hack to always run some code after a successful restore]
restore the game rule response (B) is "[post-restore routine]";

 To say post-restore routine:
	say "Ok. ";
	recover sound channels;
	recreate sound channels;
	restore channel states;
	check for unsupported features.

To recover sound channels:
	let C be the channel following 0;
	while C is not 0:
		[say "Found a channel with id [C] and rock [rock of channel id C].";]
		repeat with C2 running through sound channels:
			if rock of C2 is rock of channel id C:
				now channel id of C2 is C;
				[say "Added it at index [index of C2].";]
				if C2 is uncreated:
					now C2 is stopped;
		now C is the channel following C.

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

To restore channel states:
	let multi be false;
	repeat with C running through sound channels:
		if C is stopped:
			stop channel id (channel id of C);
			[say "Stopped channel [C].";]
		otherwise if C is playing or C is paused:
			let error be the result of playing channel id (channel id of C) with sound (channel-sound of C) and (repeats of C) repeats and notification (notification of C);
			if error is 0:
				say "Error! Failed to play channel [C].";
			[say "Started channel [C].";]
			if C is paused and glulx sounds are fully supported:
				pause channel id (channel id of C);
				[say "Paused channel [C].";]
		if multiplay state of C is true:
			now multi is true;
	if multi is true and glulx sounds are fully supported:
		multiplay sound.

Volume 8 - Inform 6 glue

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

To decide which number is the result of playing (SFX - sound name) with (R - a number) repeats/repeat and notification (N - a number):
	(- glk_schannel_play_ext(current_channel, ResourceIDsOfSounds-->{SFX}, {R}, {N}) -).

To decide which number is the result of playing channel id (C - a number) with sound (SFX - sound name) and (R - a number) repeats/repeat and notification (N - a number):
	(- glk_schannel_play_ext({C}, ResourceIDsOfSounds-->{SFX}, {R}, {N}) -).

To decide which number is the result of playing (SFX - sound name):
	(- glk_schannel_play(current_channel, ResourceIDsOfSounds-->{SFX}) -).

To volume-adjust to (N - a number):
	(- glk_schannel_set_volume(current_channel, {N}); -).

To volume-adjust to (X - a number) with a duration of (Y - a number) and notification (N - a number):
	(- glk_schannel_set_volume_ext(current_channel, {X}, {Y}, {N}); -).

To stop sound:
	(- glk_schannel_stop(current_channel); -).

To stop channel id (N - a number):
	(- glk_schannel_stop({N}); -).

To pause sound:
	(- glk_schannel_pause(current_channel); -).

To pause channel id (N - a number):
	(- glk_schannel_pause({N}); -).

To unpause sound:
	(- glk_schannel_unpause(current_channel); -).

To unpause channel id (N - a number):
	(- glk_schannel_unpause({N}); -).

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

To stop all channels:
	(- Stop_all_channels(); -).

Include (-

[ Stop_all_channels chan;

	chan = glk_schannel_iterate(0, 0);
	while (chan)
	{
		glk_schannel_stop(chan);
		chan = glk_schannel_iterate(chan, 0);
	}
];

-).

Volume 9 - Automatic testing

Understand "autotest" or "auto test/--" or "automated test/--" as autotesting. Autotesting is an action applying to nothing. Carry out autotesting:
	autotest.

To autotest:
	(- Autotest(); -).

Test me with "autotest".

Section 1 - Individual test commands

Understand "advanced" as fulltesting. Fulltesting is an action applying to nothing. Carry out fulltesting:
	advance.

To advance:
	(- Auto_initialize(); if (Advanced_autotest()) print "^"; Auto_uninitialize(); -).

Test advanced with "advanced".

Understand "volumetest" as volumetesting. Volumetesting is an action applying to nothing. Carry out volumetesting:
	volumetest.

To volumetest:
	(- Auto_initialize(); if (Volume_test()) print "^"; Auto_uninitialize(); -).

Test volume with "volumetest".

Understand "modtest" as modtesting. Modtesting is an action applying to nothing. Carry out modtesting:
	modtest.

To modtest:
	(- Auto_initialize(); if (MOD_test()) print "^"; Auto_uninitialize(); -).

Test mod with "modtest".

Understand "notifytest" as notifytesting. Notifytesting is an action applying to nothing. Carry out notifytesting:
	notifytest.

To notifytest:
	(- Auto_initialize(); if (Notify_test()) print "^"; Auto_uninitialize(); -).

Test notify with "notifytest".

Understand "pausetest" as pausetesting. Pausetesting is an action applying to nothing. Carry out pausetesting:
	pausetest.

To pausetest:
	(- Auto_initialize(); if (Pause_test()) print "^"; Auto_uninitialize(); -).

Test pause with "pausetest".

Understand "multitest" as multitesting. Multitesting is an action applying to nothing. Carry out multitesting:
	multitest.

To multitest:
	(- Auto_initialize(); if (Play_multi_test()) print "^"; Auto_uninitialize(); -).

Test multi with "multitest".

Understand "fadetest" as fadetesting. Fadetesting is an action applying to nothing. Carry out fadetesting:
	fadetest.

To fadetest:
	(- Auto_initialize(); if (Volume_change_duration_test()) print "^"; Auto_uninitialize(); -).

Test fade with "fadetest".


Section 2 - Inform 6 stuff


Test-running is a truth state that varies. The test-running variable translates into I6 as "running_test".

Include (-

Global running_test = 0;
Global notify_expected = 0;

Array tchan --> 4;
Array expected_notifys --> 4;

-) after "Definitions.i6t".

To handle test volume notification (N - a number):
	(- handle_test_volume_notification({N}); -).

To handle test sound notification (N - a number):
	(- handle_test_sound_notification({N}); -).


Include (-

[ Auto_initialize chan biggest_rock rockptr i;

	Stop_all_channels();
	Auto_uninitialize();

	running_test = 1;

	!First, we try to find the sound channel with greatest rock.

	chan = glk_schannel_iterate(0, biggest_rock);

	if (~~chan)
	{
		print "^Error! No sound channels found.^";
		biggest_rock = GG_BACKGROUNDCHAN_ROCK;
	}
	else
		while (chan)
		{
			chan = glk_schannel_iterate(chan, rockptr);

			if (rockptr > biggest_rock)
				biggest_rock = rockptr;
		}

	! Next, we try create four new channels with rock numbers above the one we found.

	biggest_rock = biggest_rock +1;

	for ( i = 0 : i < 4 : i++ )
	{

		tchan --> i = glk_schannel_create(biggest_rock + i);

		if (~~(tchan --> i))
		{
			print "^Error! Could not create test channel ", i, ". Continue anyway?^>>";
			if (YesOrNo()==0) rfalse;
		}
	}

	rtrue;
];

[ Auto_uninitialize chan lastchan i;

	notify_expected = 0;

	for ( i = 0 : i < 4 : i++ ) expected_notifys --> i = 0;

	chan = glk_schannel_iterate(0, 0);

	if (~~chan)
	{
		! No sound channels exist, nothing to do
		rfalse;
	}
	else
		while (chan)
		{
			lastchan = chan;
			chan = glk_schannel_iterate(chan, 0);

			for ( i = 0 : i < 4 : i++ )
			{
				if (lastchan == tchan --> i)
				{
					glk_schannel_destroy(tchan --> i);
				}

			}
		}

		for ( i = 0 : i < 4 : i++ ) tchan --> i = GLK_NULL;

		running_test = 0;
];

[ Autotest ;

	if (~~Auto_initialize())
	{
		print "^Could not create required sound channels. Test cancelled.^^";
		rfalse;
	}

	if (~~Basic_autotest())
	{
		Auto_uninitialize();
		rfalse;
	}

	if (glk_gestalt(gestalt_Sound2, 0))
		Advanced_autotest();

	Auto_uninitialize();
	rfalse;
];

[ Basic_autotest res;

	print "Running automatic test suite.^";

	res = glk_gestalt(gestalt_Sound2, 0);

	print "^glk_gestalt(gestalt_Sound2, 0)^";

	if (res)
		print "This interpreter claims to support ALL sound functions. This means that all the following gestalt function calls should return true as well.^";
	else
		print "This interpreter claims to NOT support all sound functions.^";

	print "^glk_gestalt(gestalt_Sound, 0)^";

	if (glk_gestalt(gestalt_Sound, 0))
	{
		print "This interpreter claims to support the basic set of sound functions.^";
	}
	else
	{
		if (res)
			print "Error! This interpreter claims to support all sound functions, but also claims to NOT support the basic set of sound functions.^";
		else
			print "This interpreter claims to NOT support the basic set of sound functions.^";
	}

	print "^glk_gestalt(gestalt_SoundMusic, 0)^";

	if (glk_gestalt(gestalt_SoundMusic, 0))
	{
		print "This interpreter claims to support playing MOD songs.^";
	}
	else
	{
		if (res)
			print "Error! This interpreter claims to support all sound functions, but also claims to NOT support playing MOD songs.^";
		else
			print "This interpreter claims to NOT support playing MOD songs.^";
	}

	print "^glk_gestalt(gestalt_SoundVolume, 0)^";

	if (glk_gestalt(gestalt_SoundVolume, 0))
	{
		print "This interpreter claims to support the glk_schannel_set_volume() function.^";
	}
	else
	{
		if (res)
			print "Error! This interpreter claims to support all sound functions, but also claims to NOT support the glk_schannel_set_volume() function.^";
		else
			print "This interpreter claims to NOT support the glk_schannel_set_volume() function.^";
	}

	print "^glk_gestalt(gestalt_SoundNotify, 0)^";

	if (glk_gestalt(gestalt_SoundNotify, 0))
	{
		print "This interpreter claims to support sound notification events.^";
	}
	else
	{
		if (res)
			print "Error! This interpreter claims to support all sound functions, but also claims to NOT support sound notification events.^";
		else
			print "This interpreter claims to NOT support sound notification events.^";
	}

	print "^Press any key except escape to start the basic sound test, or escape to cancel test suite.^[Any time you are told to press any key during these tests, escape will cancel the entire test suite.]^";

	Auto_initialize();

	if (MyPause() == -8) rfalse; ! Wait for key, bail if user pressed escape

	glk_sound_load_hint(ResourceIDsOfSounds-->(+ sound of AIFF +), 1);
	glk_sound_load_hint(ResourceIDsOfSounds-->(+ sound of MOD +), 1);
	glk_sound_load_hint(ResourceIDsOfSounds-->(+ sound of OGG +), 1);

	print "^Called glk_sound_load_hint() three times to give the library a hint that each of the three sound types should be loaded.^";

	if (~~glk_schannel_play(tchan --> 0, ResourceIDsOfSounds-->(+ sound of OGG +)))
		print "^Error! Could not start the OGG on the first channel with glk_schannel_play()!";
	else
		print "^Started playing the first channel using glk_schannel_play(). You should now be hearing the OGG play.";

	print "^^Press any key to continue.";

	if (MyPause() == -8) rfalse; ! Wait for key, bail if user pressed escape

	if (~~glk_schannel_play_ext(tchan --> 1, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 2))
		print "^^Error! Could not start the AIFF on the second channel with glk_schannel_play_ext()!";
	else
	{
		print "^^Started playing the second channel. You should now be hearing the AIFF. Unless you waited long enough for the OGG to finish, you should also still be hearing the OGG.";

		if (glk_gestalt(gestalt_SoundNotify, 0))
		{
			print "^^When the AIFF stops playing, a sound notification message should be printed ([Sound notification 2.]). Not if you press a button before it has finished, though.";
			notify_expected = 1;
			expected_notifys --> 0 = 2;
		}
	}

	print "^^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	notify_expected = 0;

	if (~~glk_schannel_play_ext(tchan --> 3, ResourceIDsOfSounds-->(+ sound of OGG +), 1, 2))
		print "^Error: could not start OGG on the third channel with glk_schannel_play_ext().^";
	else
	{
		glk_schannel_stop(tchan --> 3);
		print "^Started a sound on another channel and immediately stopped it with glk_schannel_stop(). You should be hearing nothing.^";
	}

	Auto_initialize();

	if (~~Volume_test()) rfalse;

	Auto_initialize();

	if (~~MOD_test()) rfalse;

	print "^";

	Auto_initialize();

	if (~~Notify_test()) rfalse;

	Auto_uninitialize();

	print "^This concludes the basic sound test.^^";
	rtrue;
];

[ Advanced_autotest rock;

	if (~~glk_gestalt(gestalt_Sound2, 0))
	{
		print "This interpreter claims to not support the Glk sound functions used in this test. ";
		print "Do you want to try running it anyway?^>>";
		if (YesOrNo()==0) rfalse;
	}

	print "^Running extended automated sound test suite.^";

	Auto_initialize();

	rock = glk_schannel_get_rock(tchan --> 0);

	glk_schannel_destroy(tchan --> 0);

	tchan --> 0 = glk_schannel_create_ext(rock, $8000);

	glk_schannel_play_ext(tchan --> 0, ResourceIDsOfSounds-->(+ sound of MOD +), -1, 0);

	print "^Created a new channel with glk_schannel_create_ext() at half volume and started to play a MOD on it.^";

	if (MyPause() == -8) rfalse;

	! Quickly fade out
	glk_schannel_set_volume_ext( tchan --> 0, 0, 1000, 0);

	if (~~Pause_test()) rfalse;

	Auto_initialize();

	if (~~Play_multi_test()) rfalse;

	Auto_initialize();

	print "^";

	if (~~Volume_change_duration_test()) rfalse;

	Auto_uninitialize();

	print "^This concludes the test suite.^^";

	rtrue;
];

[ Volume_test chan chan2;

	if (~~glk_gestalt(gestalt_SoundVolume, 0))
	{
		print "^This interpreter does not support glk_schannel_set_volume(). ";
		print "Do you want to run this test anyway?^>>";
		if (YesOrNo()==0) rfalse;
	}

	chan = tchan --> 0;
	chan2 = tchan --> 1;

	print "^Press any key to start the basic volume test.";

	if (MyPause() == -8) rfalse;

	glk_schannel_play_ext(chan, ResourceIDsOfSounds-->(+ sound of AIFF +), -1, 1);

	print "^^You should now be hearing the AIFF sound playing at full volume. Press any key to contine.";

	if (MyPause() == -8) rfalse;

	print "^^Set the volume to 0x20000, double the Glk max of 0x10000. This may have no effect or cause an error. Press any key to lower the volume.";

	glk_schannel_set_volume(chan, $20000);

	if (MyPause() == -8) rfalse;

	print "^^Now the volume of the AIFF should have changed to half volume. Press any key to continue.";

	glk_schannel_set_volume(chan, $8000);

	if (MyPause() == -8) rfalse;

	print "^^Now the volume of the AIFF should have changed to 0, so no sound should be heard.^^Press any key to continue.";

	glk_schannel_set_volume(chan, 0);
	glk_schannel_set_volume(chan2, 0);
	glk_schannel_play_ext(chan2, ResourceIDsOfSounds-->(+ sound of OGG +), -1, 1);

	if (MyPause() == -8) rfalse;

	print "^^Now the AIFF should be playing at full volume, along with an OGG at half volume. Press any key to continue.";

	glk_schannel_set_volume(chan, $10000);
	glk_schannel_set_volume(chan2, $8000);

	if (MyPause() == -8) rfalse;

	print "^^Now both sounds should be playing at full volume. Press any key to conclude the test.";

	glk_schannel_set_volume(chan2, $10000);

	if (MyPause() == -8) rfalse;

	print "^";

	rtrue;
];

[ MOD_test ;

	if (~~glk_gestalt(gestalt_SoundMusic, 0))
	{
		print "^This interpreter does not support MOD music. ";
		print "Do you want to run this test anyway?^>>";
		if (YesOrNo() == 0) rtrue;
	}

	print "^Press any key to begin the MOD test.";

	if (MyPause() == -8) rfalse;

	if (~~glk_schannel_play_ext(tchan --> 0, ResourceIDsOfSounds-->(+ sound of MOD +), -1, 1))
	{
		print "^^Error! Could not play MOD";
		if (glk_gestalt(gestalt_SoundMusic, 0))
			print ", contrary to what this interpreter claims";
		print ". Test will now exit.";
		Auto_uninitialize();
		rtrue;
	}
	else
		print "^^You should now be hearing the MOD sound playing.";

	print "^^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	if (~~glk_schannel_play_ext(tchan --> 1, ResourceIDsOfSounds-->(+ sound of MOD +), -1, 1))
	{
		print "^^Failed to start another MOD on the second channel. That probably means that this interpreter only supports playing one MOD at a time.";
	}
	else
		print "^^Started another MOD sound on the second channel.";

	print "^^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	if (~~glk_schannel_play_ext( tchan --> 2, ResourceIDsOfSounds-->(+ sound of MOD +), -1, 1))
		print "^^Failed to start third MOD on the third channel. That probably means that this interpreter only supports playing one MOD at a time.";
	else
		print "^^Started a third MOD sound on the third channel.";

	print "^^Press any key to conclude to MOD test.";

	if (MyPause() == -8) rfalse;

	print "^";

	rtrue;
];

[ Notify_test;

	if (~~glk_gestalt(gestalt_SoundNotify, 0))
	{
		print "^This interpreter does not support sound notifications. ";
		print "Do you want to run this test anyway?^>>";
		if (YesOrNo() == 0) rfalse;
		print "^";
	}

	print "Press any key to begin the notification test.";

	if (MyPause() == -8) rfalse;

	glk_schannel_play_ext( tchan --> 0, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 1);
	glk_schannel_play_ext( tchan --> 1, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 2);
	glk_schannel_play_ext( tchan --> 2, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 3);

	print "^^Now playing three AIFF sounds on three different channels. If you wait for them to finish, you should get three sound notifications.^";

	notify_expected = 1;
	expected_notifys --> 0 = 1;
	expected_notifys --> 1 = 2;
	expected_notifys --> 2 = 3;

	print "^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	notify_expected = 0;
	expected_notifys --> 0 = 0;
	expected_notifys --> 1 = 0;
	expected_notifys --> 2 = 0;

	glk_schannel_play_ext( tchan --> 0, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 1);

	glk_schannel_stop(tchan --> 0);

	glk_schannel_play_ext( tchan --> 1, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 2);

	! Interrupting channel tchan --> 1 with a new sound
	glk_schannel_play_ext( tchan --> 1, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 0);

	glk_schannel_play_ext( tchan --> 2, ResourceIDsOfSounds-->(+ sound of AIFF +), 1, 3);

	glk_schannel_destroy(tchan --> 2);

	print "^Again playing three AIFF sounds on three channels. This time there should be no notifications.";

	print "^^Press any key to conclude the notification test.";

	if (MyPause() == -8) rfalse;

	print "^";

	rtrue;
];

[ Pause_test res;

	if (~~glk_gestalt(gestalt_Sound2, 0))
	{
		print "^This interpreter does not support the glk_schannel_pause() or glk_schannel_unpause() functions. ";
		print "Do you want to run this test anyway?^>>";
		if (YesOrNo() == 0) rfalse;
	}

	print "^Press any key to begin the pause test.";

	if (MyPause() == -8) rfalse;

	glk_schannel_set_volume(tchan --> 0, $10000);

	glk_schannel_play_ext(tchan --> 0, ResourceIDsOfSounds-->(+ sound of MOD +), -1, 0);

	print "^^Started to play a MOD. Press any key to pause it.";

	if (MyPause() == -8) rfalse;

	glk_schannel_pause(tchan --> 0);

	glk_schannel_pause(tchan --> 0);

	print "^^The sound channel is now paused. Press any key to resume it.";

	if (MyPause() == -8) rfalse;

	glk_schannel_unpause(tchan --> 0);

	print "^^The sound channel should now resume from the exakt same place where it was paused. Press any key to pause it again.";

	if (MyPause() == -8) rfalse;

	glk_schannel_pause(tchan --> 0);

	glk_schannel_set_volume(tchan --> 0, $8000);

	print "^^The sound channel is now paused. Press any key to resume it.";

	if (MyPause() == -8) rfalse;

	print "^^The sound channel should now resume from where it was paused, but at half volume. Press any key to pause it again.";

	glk_schannel_unpause(tchan --> 0);

	if (MyPause() == -8) rfalse;

	glk_schannel_pause(tchan --> 0);

	glk_schannel_play_ext(tchan --> 0, ResourceIDsOfSounds-->(+ sound of OGG +), -1, 0);

	print "^^The sound channel is now paused. Press any key to resume it.";

	if (MyPause() == -8) rfalse;

	glk_schannel_unpause(tchan --> 0);

	print "^^The sound channel should was resumed, but it should now be playing the OGG instead of the MOD.";

	print "^^Press any key to conclude this test.";

	if (MyPause() == -8) rfalse;

	print "^";

	rtrue;
];

[ Play_multi_test res;

	if (~~glk_gestalt(gestalt_Sound2, 0))
	{
		print "^This interpreter does not support the glk_schannel_play_multi() function. ";
		print "Do you want to run this test anyway?^>>";
		if (YesOrNo() == 0) rfalse;
	}

	print "^Press any key to begin the play multi test.";

	if (MyPause() == -8) rfalse;

	notify_expected = 1;

	expected_notifys --> 0 = 1;
	expected_notifys --> 1 = 1;

	multi_chanarray --> 0 = tchan --> 0;
	multi_chanarray --> 1 = tchan --> 1;

	multi_soundarray --> 0 = ResourceIDsOfSounds-->(+ sound of OGG +);
	multi_soundarray --> 1 = ResourceIDsOfSounds-->(+ sound of AIFF +);

	glk_schannel_play_multi(multi_chanarray, 2, multi_soundarray, 2, 1);

	print "^^Called glk_schannel_play_multi(). You should be hearing the OGG and the AIFF played at the same time.^";

	print "^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	expected_notifys --> 2 = 2;
	expected_notifys --> 3 = 2;

	glk_schannel_set_volume( tchan --> 2, $8000);
	glk_schannel_set_volume( tchan --> 3, $8000);

	multi_chanarray --> 0 = tchan --> 2;
	multi_chanarray --> 1 = tchan --> 3;

	glk_schannel_play_multi(multi_chanarray, 2, multi_soundarray, 2, 2);

	print "^Called glk_schannel_play_multi() a second time. You should hear the OGG and the AIFF playing at half volume. ";

	if (expected_notifys --> 0 == 1 ||  expected_notifys --> 1 == 1)
		print  "The old OGG should still be playing at full volume.";

	print "^^Press any key to conclude this test.";

	res = MyPause();

	if (res == -8) rfalse;

	rtrue;
];

[ Volume_change_duration_test;

	if (~~glk_gestalt(gestalt_Sound2, 0))
	{
		print "^This interpreter does not support the glk_schannel_set_volume_ext() function. ";
		print "Do you want to run this test anyway?^>>";
		if (YesOrNo() == 0) rtrue;
	}

	print "^Press any key to begin the volume change duration test.";

	if (MyPause() == -8) rfalse;

	glk_schannel_set_volume( tchan --> 0, 0);

	glk_schannel_play_ext( tchan --> 0, ResourceIDsOfSounds-->(+ sound of AIFF +), -1, 1);

	glk_schannel_set_volume_ext(tchan --> 0, $10000, 4000, 1);

	notify_expected = 1;
	expected_notifys --> 0 = 1;
	expected_notifys --> 1 = 0;
	expected_notifys --> 2 = 0;

	print "^An AIFF sound should now slowly increase in volume from silence to max in 4 seconds. When it reaches max, there should be a volume notification ([Volume notification 1.]).^";

	print "^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	glk_schannel_set_volume_ext( tchan --> 1, 0, 0, 0);

	glk_schannel_play_ext( tchan --> 1, ResourceIDsOfSounds-->(+ sound of OGG +), -1, 1);

	glk_schannel_set_volume_ext( tchan --> 0, 0, 2000, 0);

	glk_schannel_set_volume_ext( tchan --> 1, $8000, 4000, 2);

	expected_notifys --> 0 = 2;

	print "^The AIFF should now fade out to silence in 2 seconds while an OGG fades in from silence to half volume in 4 seconds. When the OGG reaches half volume, there should be another notification ([Volume notification 2.]).";

	print "^^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	glk_schannel_set_volume_ext( tchan --> 1, $8000, 2000, 3);

	expected_notifys --> 0 = 3;

	print "^The OGG should now keep playing at half volume, but there should be a notification after two seconds ([Volume notification 3.]).";

	print "^^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	glk_schannel_set_volume_ext( tchan --> 0, $4000, 3000, 4);
	glk_schannel_set_volume_ext( tchan --> 1, $10000, 5000, 5);

	glk_schannel_set_volume_ext( tchan --> 2, 0, 0, 0);

	glk_schannel_play_ext( tchan --> 2, ResourceIDsOfSounds-->(+ sound of MOD +), -1, 1);

	glk_schannel_set_volume_ext( tchan --> 2, $10000, 7000, 6);

	expected_notifys --> 0 = 4;
	expected_notifys --> 1 = 5;
	expected_notifys --> 2 = 6;

	print "^The OGG should now increase to max volume while an AIFF and a MOD fades in at different speeds and different target volumes.";

	print "^^Press any key to continue.";

	if (MyPause() == -8) rfalse;

	print "^All three channels will now fade to silence at different speeds.";

	print "^^Press any key to conclude this test.";

	glk_schannel_set_volume_ext( tchan --> 1, 0, 2500, 7);
	glk_schannel_set_volume_ext( tchan --> 0, 0, 5000, 8);
	glk_schannel_set_volume_ext( tchan --> 2, 0, 7000, 9);

	expected_notifys --> 0 = 7;
	expected_notifys --> 1 = 8;
	expected_notifys --> 2 = 9;

	if (MyPause() == -8) rfalse;

	print "^";

	rtrue;
];

[ handle_test_volume_notification n i found;

	print "^[Volume notification ", n, ".]^";

	return handle_notifications(n);
];

[ handle_test_sound_notification n i found;

	print "^[Sound notification ", n, ".]^";
	return handle_notifications(n);
];

[ handle_notifications n i found left;

	if (~~notify_expected)
		print "[This notification was not expected. Something is broken.]^";
		rfalse;

	found = 0;
	left = 0;

	for ( i = 0: i < 4 : i++ )
	{
		 if (expected_notifys --> i == n)
		{
			found = 1;
			expected_notifys --> i = 0;
		}

		if (expected_notifys --> i ~= 0)
			left = 1;
	}

	! If all expected notifications are found or 0, notify_expected should be false
	if (left ==  0)
		notify_expected = 0;

	if (~~found)
		print "[Wrong notification id! Did not expect notification ", n, ".]^";
		rfalse;

	rtrue;
];

[ MyPause key evt;
	while ( 1 )
	{
		key = VM_KeyChar();
		if ( key == -4 or -5 or -10 or -11 or -12 or -13 )
		{
			evt = HandleGlkEvent();
			continue;
		}
		if (key == -8)
		{
			print "^^Cancelled.^";
		}
		return key;
	}
];

-).

Volume 10 - Line echo replacement

Echoed already is a truth state that varies.

Include (-

Global echoed_already = 0;
Global stored_buffer = 0;

-) after "Definitions.i6t".

The echoed already variable translates into I6 as "echoed_already".

When play begins (this is the check for echo suppression support rule):
	if glulx line input echo suppression is supported:
		suppress line input echo in the main window.

To suppress line input echo in the/-- main window:
	(- glk_set_echo_line_event(gg_mainwin, GLK_NULL); -)

To restart line input in the/-- main window:
    (-  glk_request_line_event(gg_mainwin, stored_buffer + WORDSIZE, INPUT_BUFFER_LEN - WORDSIZE, stored_buffer-->0); -)

To cancel line input in the/-- main window, preserving keystrokes:
    (- glk_cancel_line_event(gg_mainwin, gg_event); stored_buffer-->0 = gg_event-->2; -)

A command-showing rule (this is the new print text to the input prompt rule):
	now echoed already is true;
	say "[input-style-for-glulx][Glulx replacement command][roman type][conditional paragraph break]".

The new print text to the input prompt rule is listed instead of the print text to the input prompt rule in the command-showing rules.

Include (-

[ VM_KeyChar win nostat done res ix jx ch;
	jx = ch; ! squash compiler warnings
	if (win == 0) win = gg_mainwin;
	if (gg_commandstr ~= 0 && gg_command_reading ~= false) {
		done = glk_get_line_stream(gg_commandstr, gg_arguments, 31);
		if (done == 0) {
			glk_stream_close(gg_commandstr, 0);
			gg_commandstr = 0;
			gg_command_reading = false;
			! fall through to normal user input.
		} else {
			! Trim the trailing newline
			if (gg_arguments->(done-1) == 10) done = done-1;
			res = gg_arguments->0;
			if (res == '\') {
				res = 0;
				for (ix=1 : ix<done : ix++) {
					ch = gg_arguments->ix;
					if (ch >= '0' && ch <= '9') {
						@shiftl res 4 res;
						res = res + (ch-'0');
					} else if (ch >= 'a' && ch <= 'f') {
						@shiftl res 4 res;
						res = res + (ch+10-'a');
					} else if (ch >= 'A' && ch <= 'F') {
						@shiftl res 4 res;
						res = res + (ch+10-'A');
					}
				}
			}
			jump KCPContinue;
		}
	}
	done = false;
	glk_request_char_event(win);
	while (~~done) {
		glk_select(gg_event);
		switch (gg_event-->0) {
		  5: ! evtype_Arrange
			if (nostat) {
				glk_cancel_char_event(win);
				res = $80000000;
				done = true;
				break;
			}
			DrawStatusLine();
		  2: ! evtype_CharInput
			if (gg_event-->1 == win) {
				res = gg_event-->2;
				done = true;
				}
		}
		ix = HandleGlkEvent(gg_event, 1, gg_arguments);
		if (ix == 2) {
			res = gg_arguments-->0;
			done = true;
		} else if (ix == -1)  done = false;
	}
	if (gg_commandstr ~= 0 && gg_command_reading == false) {
		if (res < 32 || res >= 256 || (res == '\' or ' ')) {
			glk_put_char_stream(gg_commandstr, '\');
			done = 0;
			jx = res;
			for (ix=0 : ix<8 : ix++) {
				@ushiftr jx 28 ch;
				@shiftl jx 4 jx;
				ch = ch & $0F;
				if (ch ~= 0 || ix == 7) done = 1;
				if (done) {
					if (ch >= 0 && ch <= 9) ch = ch + '0';
					else					ch = (ch - 10) + 'A';
					glk_put_char_stream(gg_commandstr, ch);
				}
			}
		} else {
			glk_put_char_stream(gg_commandstr, res);
		}
		glk_put_char_stream(gg_commandstr, 10); ! newline
	}
  .KCPContinue;
	return res;
];

[ VM_KeyDelay tenths  key done ix;
	glk_request_char_event(gg_mainwin);
	glk_request_timer_events(tenths*100);
	while (~~done) {
		glk_select(gg_event);
		ix = HandleGlkEvent(gg_event, 1, gg_arguments);
		if (ix == 2) {
			key = gg_arguments-->0;
			done = true;
		}
		else if (ix >= 0 && gg_event-->0 == 1 or 2) {
			key = gg_event-->2;
			done = true;
		}
	}
	glk_cancel_char_event(gg_mainwin);
	glk_request_timer_events(0);
	return key;
];

[ VM_ReadKeyboard  a_buffer a_table done ix;
	if (gg_commandstr ~= 0 && gg_command_reading ~= false) {
		done = glk_get_line_stream(gg_commandstr, a_buffer+WORDSIZE,
			(INPUT_BUFFER_LEN-WORDSIZE)-1);
		if (done == 0) {
			glk_stream_close(gg_commandstr, 0);
			gg_commandstr = 0;
			gg_command_reading = false;
		}
		else {
			! Trim the trailing newline
			if ((a_buffer+WORDSIZE)->(done-1) == 10) done = done-1;
			a_buffer-->0 = done;
			VM_Style(INPUT_VMSTY);
			glk_put_buffer(a_buffer+WORDSIZE, done);
			VM_Style(NORMAL_VMSTY);
			print "^";
			jump KPContinue;
		}
	}
	done = false;
	! === NEW ===
	stored_buffer = a_buffer;
	! === END ===
	glk_request_line_event(gg_mainwin, a_buffer+WORDSIZE, INPUT_BUFFER_LEN-WORDSIZE, 0);
	while (~~done) {
		glk_select(gg_event);
		switch (gg_event-->0) {
		  5: ! evtype_Arrange
			DrawStatusLine();
		  3: ! evtype_LineInput
			if (gg_event-->1 == gg_mainwin) {
				a_buffer-->0 = gg_event-->2;
				done = true;
			}
		}
		ix = HandleGlkEvent(gg_event, 0, a_buffer);
		if (ix == 2) done = true;
		else if (ix == -1) done = false;
	}
	if (gg_commandstr ~= 0 && gg_command_reading == false) {
		glk_put_buffer_stream(gg_commandstr, a_buffer+WORDSIZE, a_buffer-->0);
		glk_put_char_stream(gg_commandstr, 10); ! newline
	}
  .KPContinue;
	VM_Tokenise(a_buffer,a_table);
	! It's time to close any quote window we've got going.
	if (gg_quotewin) {
		glk_window_close(gg_quotewin, 0);
		gg_quotewin = 0;
	}

	! === NEW ===

	if ((glk_gestalt(gestalt_LineInputEcho, 0)) && echoed_already == 0) {
		glk_set_style(style_Input);
		for (ix=WORDSIZE: ix<(a_buffer-->0)+WORDSIZE: ix++) print (char) a_buffer->ix;
		style roman;
		print "^";
	}
	echoed_already = 0;

	! === END ===

	#ifdef ECHO_COMMANDS;
	print "** ";
	for (ix=WORDSIZE: ix<(a_buffer-->0)+WORDSIZE: ix++) print (char) a_buffer->ix;
	print "^";
	#endif; ! ECHO_COMMANDS
];

-) instead of "Keyboard Input" in "Glulx.i6t".
