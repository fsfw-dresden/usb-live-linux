// This file can be used to configure global preferences for Firefox
// c.f. https://developer.mozilla.org/de/docs/Mozilla/Firefox/Nutzung_in_Unternehmen

// Deaktiviert den Updater
lockPref("app.update.enabled", false);
// Stellt sicher dass er tatsächlich abgestellt ist
lockPref("app.update.auto", false);
lockPref("app.update.mode", 0);
lockPref("app.update.service.enabled", false);

// Deaktiviert 'Kenne deine Rechte' beim ersten Start
pref("browser.rights.3.shown", true);

// Versteckt 'Was ist neu?' beim ersten Start nach jedem Update
pref("browser.startup.homepage_override.mstone","ignore");

// Stellt eine Standard-Homepage ein - Nutzer können sie ändern
pref("browser.startup.homepage", "about:blank");

// Deaktiviert den internen PDF-Viewer
//pref("pdfjs.disabled", true);

// Deaktiviert den Flash zu JavaScript Converter
//pref("shumway.disabled", true);

// Verhindert die Frage nach der Installation des Flash Plugins
pref("plugins.notifyMissingFlash", false);

//Deaktiviert das 'plugin checking'
lockPref("plugins.hide_infobar_for_outdated_plugin", true);

// Deaktiviert den 'health reporter'
lockPref("datareporting.healthreport.service.enabled", false);

// Disable all data upload (Telemetry and FHR)
lockPref("datareporting.policy.dataSubmissionEnabled", false);

// Deaktiviert den 'crash reporter'
lockPref("toolkit.crashreporter.enabled", false);

// keine Pocket-Topstories "Empfohlen von Pocket"
lockPref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
lockPref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
lockPref("browser.newtabpage.activity-stream.feeds.telemetry", false);
lockPref("browser.newtabpage.activity-stream.default.sites", "https://www.stura.tu-dresden.de/,https://tu-dresden.de/zih/dienste,https://msx.tu-dresden.de/,https://cloudstore.zih.tu-dresden.de/,https://fsfw-dresden.de/");
