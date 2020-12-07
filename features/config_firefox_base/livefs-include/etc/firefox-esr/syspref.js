// This file can be used to configure global preferences for Firefox

// Less window decoration = more space for content
pref("browser.tabs.drawInTitlebar", true);

// Enable tab mouse wheel scrolling
pref("toolkit.tabbox.switchByScrolling", true);

// Disable slow visual tab switching
pref("browser.ctrlTab.recentlyUsedOrder", false);

// Do not show addon recommendations
pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Disable all web-notification garbage
pref("dom.webnotifications.enabled", false);
pref("dom.webnotifications.serviceworker.enabled", false);

// Because one has to select the correct language for each text input
// box to not see red, disable spell checking by default
pref("layout.spellcheckDefault", 0);

// Highlight all search matches
pref("findbar.highlightAll", true);

// Require pressing ENTER to execute search
pref("accessibility.typeaheadfind", false);

// Disable "open with" for files
pref("browser.download.forbid_open_with", true);

// Do not hide the bloody download button
pref("browser.download.autohideButton", false);

// support customization via userChrome.css
pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Don't shrink tab width so much
pref("browser.tabs.tabMinWidth", 160);

// Add zoom controls to tab toolbar
pref("browser.uiCustomization.state", "{\"placements\":{\"TabsToolbar\":[\"tabbrowser-tabs\",\"alltabs-button\",\"new-tab-button\",\"customizableui-special-spring1\",\"zoom-controls\"]}}");
