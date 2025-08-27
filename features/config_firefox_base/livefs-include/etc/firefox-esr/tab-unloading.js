// Enable automatic tab unloading (true by default only on windows & mac os)
pref("browser.tabs.unloadOnLowMemory", true);

// tab unloading enabled when free memory drops below either
pref("browser.low_commit_space_threshold_percent", 30);

// time in milliseconds to wait before kicking tabs out (15min here)
pref("browser.tabs.min_inactive_duration_before_unload", 900000);

// Better visibility 
pref("browser.tabs.fadeOutUnloadedTabs", true);
pref("browser.tabs.fadeOutExplicitlyUnloadedTabs", true);
