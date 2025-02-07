#Requires AutoHotkey v2
#Include %A_ScriptDir%\Lib\guidegui.ahk
#Include %A_ScriptDir%\Lib\webhooksgui.ahk
#Include %A_ScriptDir%\Lib\config.ahk
#Include %A_ScriptDir%\Lib\mainsettingsui.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk
#Include %A_ScriptDir%\Lib\PriorityPicker.ahk
#Include %A_ScriptDir%\Lib\UnitUpgradePriority.ahk

TaxiURL := "https://discord.gg/UB9AaPzqdq"
global InvalidURL := "https://discord.gg/2kWhUD35qK"

GemsEarned := 0
ShibuyaFood := 0
TraitRerolls := 0
StatChips := 0
SuperStatChips := 0
GreenEssence := 0
ColoredEssence := 0
CurrentChallenge := "None"
MinimizeImage := "Lib\Images\minimize.png"
CloseImage := "Lib/Images/close.png"
TaxiImage := "Lib\Images\faxi pfp.png"
DiscordImage := "Lib\Images\Discord-Logo.png"
lastlog := ""
MainGUI := Gui("-Caption +Border +AlwaysOnTop", "Macro GUI")

MainGUI.BackColor := "0c000a"
MainGUI.SetFont("s9 bold", "Segoe UI")

DiscordButton := MainGUI.Add("Picture", "x910 y8 w60 h34 +BackgroundTrans cffffff", DiscordImage)
DiscordButton.OnEvent("Click", (*) => OpenDiscord())

MinimizeButton := MainGUI.Add("Picture", "x1050 y22 w37 h9 +BackgroundTrans cffffff", MinimizeImage)
MinimizeButton.OnEvent("Click", (*) => MinimizeGUI())

CloseAppButton := MainGUI.Add("Picture", "x1102 y10 w30 h32 +BackgroundTrans cffffff", CloseImage)
CloseAppButton.OnEvent("Click", (*) => ExitApp())

GuideBttn := MainGui.Add("Button", "x830 y632 w130 cffffff +BackgroundTrans +Center", "How to use?")
GuideBttn.OnEvent("Click", (*) => OpenGuide())

#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2


; Create the initial GUI
MainSettings := Gui("+AlwaysOnTop")
MainSettings.SetFont("s8 bold", "Segoe UI")

; Set GUI properties
MainSettings.BackColor := "0c000a"
MainSettings.MarginX := 20
MainSettings.MarginY := 20
MainSettings.OnEvent("Close", (*) => MainSettings.Hide())
MainSettings.Title := "Main Settings UI"

MainSettings.Add("Text", "x10 y20 w340 h130 +Center cffffff", "Settings")

; Add Launch Button
Webhookbttn := MainSettings.Add("Button", "x110 y45 w150", "Webhook Settings")
Webhookbttn.OnEvent("Click", (*) => OpenWebhooks())

SendChatBttn := MainSettings.Add("Button", "x110 y95 w150", "Upgrade Priority")
SendChatBttn.OnEvent("Click", (*) => OpenUnitUpgrade())

SendChatBttn := MainSettings.Add("Button", "x110 y140 w150", "Keybinds")
SendChatBttn.OnEvent("Click", (*) => OpenKeybinds())

UnitTimer := MainGui.Add("DropDownList", "x700 y667 w95 Choose2", ["1.5s", "2s (Default)", "2.5s", "3s"])
MainGUI.Add("Text", "x600 y670 h60 c24be16 +BackgroundTrans", "Placement Speed")

; Show the main settings GUI
; Show the initial GUI
OpenSettings() {
    MainSettings.Show("AutoSize Center")
}

WebhookBtn := MainGui.Add("Button", "x1000 y632 w130 cffffff +BackgroundTrans +Center", "Settings")
WebhookBtn.OnEvent('Click', (*) => OpenSettings())

taxibutton := MainGUI.Add("Picture", "x820 y-20 w90 h90 +BackgroundTrans cffffff", TaxiImage)
taxibutton.OnEvent("Click", (*) => OpenDiscordTaxi())

MainGUI.AddProgress("c0x7e4141 x8 y27 h602 w800", 100) ; box behind roblox, credits to yuh for this idea
WinSetTransColor("0x7e4141 255", MainGUI)

MainGUI.Add("GroupBox", "x830 y60 w300 h200 c24be16 ", "Unit Setup")
enabled1 := MainGUI.Add("Checkbox", "x840 y80 cffffff", "Slot 1")
enabled2 := MainGUI.Add("Checkbox", "x840 y110 cffffff", "Slot 2")
enabled3 := MainGUI.Add("Checkbox", "x840 y140 cffffff", "Slot 3")
enabled4 := MainGUI.Add("Checkbox", "x840 y170 cffffff", "Slot 4")
enabled5 := MainGUI.Add("Checkbox", "x840 y200 cffffff", "Slot 5")
enabled6 := MainGUI.Add("Checkbox", "x840 y230 cffffff", "Slot 6")

hill1 := MainGUI.Add("Checkbox", "x930 y80 cffffff", "Hill")
hill2 := MainGUI.Add("Checkbox", "x930 y110 cffffff", "Hill")
hill3 := MainGUI.Add("Checkbox", "x930 y140 cffffff", "Hill")
hill4 := MainGUI.Add("Checkbox", "x930 y170 cffffff", "Hill")
hill5 := MainGUI.Add("Checkbox", "x930 y200 cffffff", "Hill")
hill6 := MainGUI.Add("Checkbox", "x930 y230 cffffff", "Hill")

placement1 := MainGUI.Add("DropDownList", "x1080 y80  w40 c201c1c Choose3", [1, 2, 3, 4, 5])
placement2 := MainGUI.Add("DropDownList", "x1080 y110 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement3 := MainGUI.Add("DropDownList", "x1080 y140 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement4 := MainGUI.Add("DropDownList", "x1080 y170 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement5 := MainGUI.Add("DropDownList", "x1080 y200 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement6 := MainGUI.Add("DropDownList", "x1080 y230 w40 cffffff Choose3", [1, 2, 3, 4, 5])

MainGUI.Add("Text", "x1000 y80 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x1000 y110 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x1000 y140 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x1000 y170 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x1000 y200 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x1000 y230 h60 cffffff +BackgroundTrans", "Placements: ")

MainGUI.Add("GroupBox", "x830 y260 w300 h280 c24be16 ", "Activity Log ")
ActivityLog := MainGUI.Add("Text", "x830 y280 w300 h300 r17 cffffff +BackgroundTrans +Center", "Macro Launched")

MainGUI.Add("GroupBox", "x830 y540 w300 h80 c24be16 ", "Keybinds")
KeyBinds := MainGUI.Add("Text", "x830 y560 w300 h300 r7 cffffff +BackgroundTrans +Center", "F1 - Fix Roblox Position `n F2 - Start Macro `n F3 - Stop Macro")

MainGUI.Add("Text", "x10 y5 h60 c2bff00 +BackgroundTrans", "Latest Update: Added Curse Womb Support") ; added by ryn
KeyFarm := MainGUI.Add("Checkbox", "x585 y640 w105 c24be16 ", "Cursed Womb") ; added by ryn
KeyFarm.OnEvent('Click', (*) => changeKeyFarm())
;KeyFarm.OnEvent('Click', (*) => AddToLog("This has been disabled till I fix the pixel search, sorry"))

SaveConfigBttn := MainGUI.Add("Button", "x700 y635 w95 h25 cffffff +Center", "Save config")
SaveConfigBttn.OnEvent("Click", (*) => SaveConfigToFile("Lib\Settings\config.txt"))

MainGUI.SetFont("s16 bold", "Segoe UI")

MainGUI.Add("Text", "x12 y632 w800 c24be16 +BackgroundTrans", "👻 Haunted Academy - Infinite - Cursed Womb 👻")

changeKeyFarm() {
    global keyFarmEnabled := KeyFarm.Value
}

MainGUI.Show("x27 y15 w1150 h700")

AddToLog(text) {
    global lastlog
    ActivityLog.Value := text "`n" ActivityLog.Value
}

MinimizeGUI() {
    WinMinimize("Macro GUI")
}

OpenDiscordTaxi() {
    AddToLog('- ' TaxiURL)
    Run(TaxiURL)
}

OpenDiscord() {
    global InvalidURL
    AddToLog('- ' InvalidURL)
    Run(InvalidURL)
}

SendChatGUI := Gui("+AlwaysOnTop")

SendChatGUI.SetFont("s8 bold", "Segoe UI")
SendChatGUI.Add("Text", "x10 y8 w280 cWhite", "Would you like the macro to send a message once it loads in a game? (it only sends it once per game and this is optional)")

SendChatGUI.Add("Text", "x10 y56 cWhite", "Message to send")
ChatToSend := SendChatGUI.Add("Edit", "x10 y70 w280", "")

ChatStatusBox := SendChatGUI.Add("Checkbox", "x10 y109 cWhite", "Enabled")

SendChatGUI.BackColor := "0c000a"
SendChatGUI.MarginX := 20
SendChatGUI.MarginY := 20

SendChatGUI.OnEvent("Close", (*) => SendChatGUI.Hide())
SendChatGUI.Title := "Send Chat"


OpenSendChat() {
    SendChatGUI.Show("w300 h150")
}

LoadLocal()
LoadWebhookSettings(true)
LoadHotkeys()