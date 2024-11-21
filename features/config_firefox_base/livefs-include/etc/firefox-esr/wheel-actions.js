// thanks @cor-el on https://support.mozilla.org/bm/questions/1337610#answer-1415786
// Mousewheel prefs:
// mousewheel.default.action
// mousewheel.with_*.action
// mousewheel.with_alt.action = 2
// mousewheel.with_control.action = 3
// mousewheel.with_meta.action = 1
// mousewheel.with_shift.action = 4
// mousewheel.with_win.action= 1 
// 
// Action:
// 0: Nothing happens
// 1: Scrolling contents
// 2: Go back or go forward, in your history
// 3: Zoom in or out (reflowing zoom)
// 4: Treat vertical wheel as horizontal scroll
// 5: Zoom in or out (pinch zoom)
pref("mousewheel.with_alt.action", 0);
pref("mousewheel.with_shift.action", 5);
