﻿/* 

huge thanks to:
yuh for heavily inspiring  the macro + some functions
------------------------------------------------------------
credit to invalid for namek macro

Contributions:
base code: faxi
configs: keirahela
update tp to spawn & cursed womb: ryn

*/

#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk

global MacroStartTime := A_TickCount

SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence := "|<>*91$66.btzzzzzzyDzXlzzzzzzyDzXlzzzzzzyDzXlzzzyzzyDbXlUS0UM3UC1XlUA0UE30A1XlW4EXl34AMXlX0sbXXC80XVX4MbXX6A1U3UA0bk30ARk7UC0bk3UA1sDUz8bw3kC1zzbyszzzzzzzzbw1zzzzzzzzby3zzzzzzzzzzjzzzzzzU"
MaxUpgrade := "|<>*134$53.0000000007U3k00000TUDk00001XUsk000033XVU0000636300800A3M6TzwS0M3UDrjRa0k70S0AS61U40s0EMAD001U0k0Ty41331k1zwA6673k7zsQAAS7UTzkwsMQC0TzVzkk0M0Tz3zVk0kETy7z3k1VkzwTz7kX7nzzzzzzzzzzzzzzzzzzw"
MaxUpgrade2 := "|<>*146$47.D07U0001z0Tk000371lU00067z3zzzzw7w7zzzzs7kDzzzzk7UTzSzzUC0w0MwD081k0UkS00301U1w82663U3sMAAC7UDkssMwD0zVvkksQ0z3zVU0k0y7z3U1UUwDy7U33VszyDX6Dbzzzzzzzzzzzzzzzy"
MaxUpgrade3 := "|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart := "|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText := "|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText := "|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI := "|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence := "|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking := "|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
AutoAbility := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
ClaimText := "|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen:="|<>*91$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDzzzwTy7zzzwTzzzsTwDzzzszzzzkzkTzzzlzzzzUzUz3zlXyDzz1y1s1y07k3zy1s3U1s0D03zw1k631UkQD7zsX0AD33ksy7zl28Mz6Dlk0DzX0klyATXU0Tz71VXwMz77zzyC733kkwC7zzwSS703k0S0DzszwD0DU0y0DzlzsT0zkFy1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
ReplayText :="|<>*101$71.Tk0000Dk0001zs0000FU00000Q0001V000000A00032000000M00064000000Py7zA8TzwD3kw7NbMFnD8m4Vk3U3ka08P0D30703VM0ES0Q406033U0ksE08QA46711kkU0k0MQAC73U10100ksMMC7U60107UkksQB08D23j01Uk0P0kK40C070k0m10Y40A0O1U1a63AQ0sFa3kXAAyDjzky7xzwEkkA7tV01U0VVU000320000220000640000AA0000AM0000AE0000DU0000TU0000600000C1"
DeathText := "|<>*100$22.zzzzUzUw3w3l7l6ASAMtstXbXaASAQFgFkAEDUlUzzzzU"
Text:="|<>*30$71.0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzz0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
Spawn:="|<>*113$63.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzzzzz0Dzzzzzzzzs1zzzzzzzzz7TTzxvzizzsTk7U4QMU7z0S0M0V240zw1k1068FU3zs6C8kk0AQTzslk7701XXz7648ks0QQTs0k307V3XXz0C0Q0wMwQTy3lDl7nbXXzzyDzzzzzzzzzlzzzzzzzzzyDzzzzzzzzznzzzzzzzw"
KeyText:="|<>*116$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzztzbzzwyTDzzzly7zzksQDzzzXy7zzlkszzzz7yDzzX1VlzzyDyDzz2120k0A1wTzz0081U001szzy00E00001lzzw003UA833Xzzw6270Mk777zzsA6A0lU4CDzzksA0FX00QTzzlsw1X601szzzblw76CE7lzzzzzzzzzzzbzzzzzzzzzzyDzzzzzzzzzzkzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

global lose_streak := 0
global keyFarmEnabled := KeyFarm.Value
global keyFound := 1
global unitPlacementDelay := UnitTimer.Value

SetupMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Taxi Winter Event Farm") {
        Sleep 50
        WinActivate("Taxi Winter Event Farm")
        Sleep 100
    }
}

InitializeMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    global MacroStartTime := A_TickCount

    if WinExist("Taxi Auto-Challenge") {
        WinActivate("Taxi Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000",)
        return
    }

    if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000",)
        return
    }
}

SetDefaultKeyboard(localeID) {
    static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    binaryLocaleID := Buffer(4, 0)
    NumPut("UInt", LocaleID, binaryLocaleID)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
    for hwnd in WinGetList()
        PostMessage 0x50, 0, Lan, , hwnd
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

GoToRaids() {
    global keyFound
    SendInput ("{Tab}")
    AddToLog("For support, make sure to click on the discord icon above")
    loop {
        if (ok:=FindText(&X, &Y, 175-150000, 186-150000, 175+150000, 186+150000, 0, 0, LoadingScreen)) {
            AddToLog("Found Loading Screen, stopping loop")
            break
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            AddToLog("Found Vote Start, stopping loop")
            break
        }
        if (ok := FindText(&X, &Y, 338, 505, 536, 572, 0, 0, ClaimText)) ; daily reward
        {
            BetterClick(406, 497)
            Sleep 3000
        }
        if (keyFarmEnabled && keyFound) {
            AddToLog("Attempting to go to Cursed Womb...")
            ; go to cursed womb dungeon
            BetterClick(89, 302)
            Sleep 2000
            SendInput ("{a up}")
            ; go to teleporter
            Sleep 100
            SendInput ("{a down}")
            Sleep 3000
            SendInput ("{a up}")
            KeyWait "a" ; Wait for "d" to be fully processed
            Sleep 1200
            SendInput ("{s down}")
            Sleep 3000
            SendInput ("{s up}")
            KeyWait "s" ; Wait for "d" to be fully processed
            Sleep 1200
            BetterClick(216, 285) ; click key location
            Sleep 200
                if (ok:=FindText(&X, &Y, 433-150000, 305-150000, 433+150000, 305+150000, 0, 0, KeyText)) {
                    AddToLog("Found a key, attempting to start...")
                    BetterClick(350, 375) ; click select
                    Sleep 35000
                    break
                } else {
                    AddToLog("Didn't find cursed womb key, trying another..")
                    BetterClick(287, 285) ; click key #2 location
                    Sleep 200
                }
                if (ok:=FindText(&X, &Y, 433-150000, 305-150000, 433+150000, 305+150000, 0, 0, KeyText)) {
                    AddToLog("Found a key, attempting to start...")
                    BetterClick(418, 370) ; click select
                    Sleep 35000
                    break
                } else {
                    AddToLog("Didn't find a cursed womb key, returning to infinite...")
                    BetterClick(661, 205)
                    Sleep 200
                    keyFound := 0
                    break
                }
            } else {
            AddToLog("Attempting to go to Cursed Infinite...")
            ; go to play area
            BetterClick(89, 302) ; play
            Sleep 1000
            HoldKey("d", 1600)
            Sleep 500
            HoldKey("w", 2400)
            Sleep 1000
            BetterClick(720, 241) ; namek planet thing
            Sleep 1000
        }

        loop 2 {
            Sleep 150
            SendInput ("{WheelDown 1}") ; Scrolling to reach Haunted Acadamy Box
        }
        Sleep 1000
        BetterClick(700,425) ; Haunted Academy Box
        Sleep 1000
    
        BetterClick(290, 240) ; Infinite
        Sleep 1000
    
        BetterClick(400, 439) ; play
        Sleep 1000
    
        BetterClick(340, 325)
        sleep 1000

        BetterClick(400, 460) ; cancel
        Sleep 5000
    }
    LoadedLoop()
    OnSpawnSetup()
    PressVoteStart()
    StartedLoop()
    TryPlacingUnits()

}

Replaying() {
    loop {
        if (ok:=FindText(&X, &Y, 175-150000, 186-150000, 175+150000, 186+150000, 0, 0, LoadingScreen)) {
            AddToLog("Found Loading Screen, stopping loop")
            break
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            AddToLog("Found Vote Start, stopping loop")
            break
        }
        Reconnect()
        sleep 5000 ; cd wont spam loops
    }
    LoadedLoop()
    OnSpawnSetup()
    PressVoteStart()
    StartedLoop()
    TryPlacingUnits()
}

StopMacro() {
    SaveLocal
    if ControlGetVisible(keybindsGui) {
        return
    }
    Reload()
}
; Define the rectangle coordinates
global startX := 200, startY := 280, endX := 450, endY := 200
global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed
global Hillx := 0
global Hilly := 0
global HillStartingX := ""

PlaceFirstHillUnit(slot := 1) {
    global Hillx
    global Hilly
    SendInput(slot)
    Sleep 100
    PixelSearch(&Hx, &Hy, 400, 160, 600, 235, keyFarmEnabled & keyFound ? 0x04A302 : 0x06B10E, 5) ;Credit: zredlohtop for updating the colors
    if (Hx == "", Hy == "") {
        return false
    }
    else {
        Sleep 100
        BetterClick(Hx, Hy)
        Sleep 100
        SendInput("q")

        if IsPlacementSuccessful() {
            Sleep 15
            Hillx := Hx
            Hilly := Hy
            return true
        }
    }
    return false
}

PlaceOtherHillUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
    return false
}

PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
    return false
}

IsPlacementSuccessful() {

    Sleep 3000
    if (ok := FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        AddToLog("Placed unit successfully")
        BetterClick(329, 184) ; close upg menu
        return true
    }
    return false
}

#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\Gdip_All.ahk

TryPlacingUnits() {
    global startX, startY, endX, endY, step, successfulCoordinates, Hillx, Hilly, HillStartingX
    HillStartingX := ""

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    Tries := 0
    HillplacementCount := 0

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        hill := "Hill" slotNum
        hill := %hill%
        hill := hill.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text


        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        
        if (hill = 1) {
            while (placementCount < placements) {
                if (HillplacementCount < 1) {
                    if PlaceFirstHillUnit(slotNum) {
                        placementCount++
                        HillplacementCount++
                        successfulCoordinates.Push({ x: Hillx, y: Hilly})
                        HillStartingX := Hillx
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                    BetterClick(373, 237)
                    }
                    BetterClick(210, 555) ; move mouse
                    if ShouldStopUpgrading(1) {
                        AddToLog("Stopping due to finding lobby  condition.")
                        return keyFarmEnabled & keyFound ? LobbyLoop() : Replaying()
                    }
                    Reconnect()
                }
                if (HillplacementCount >= 1) {
                    if PlaceOtherHillUnit(Hillx, Hilly, slotNum) {
                        placementCount++
                        HillplacementCount++
                        successfulCoordinates.Push({ x: Hillx, y: Hilly})
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                    BetterClick(373, 237)
                    }
                    BetterClick(210, 555) ; move mouse
                    if ShouldStopUpgrading(1) {
                        AddToLog("Stopping due to finding lobby condition.")
                        return keyFarmEnabled & keyFound ? LobbyLoop() : Replaying()
                    }
                    Hillx += step - 20
                    Tries += 1
                    Reconnect()
                }
                if Tries == 8 {
                    Tries := 0
                    Hillx := HillStartingX
                    Hilly -= (-step - 0)
                }

            }  
            Reconnect() 
        }

        ; Continue placement for the current slot
        if !(hill = 1) {
            while (placementCount < placements && y >= endY) { ; Rows
                while (placementCount < placements && x <= endX) { ; Columns
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1) {
                        AddToLog("Stopping due to finding lobby  condition.")
                        return keyFarmEnabled & keyFound ? LobbyLoop() : Replaying()
                    }
                    Reconnect()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }        
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

UpgradeUnits() {
    global successfulCoordinates

    AddToLog("Beginning unit upgrades.")

    while true { ; Infinite loop to ensure continuous checking
        for index, coord in successfulCoordinates {

            UpgradeUnit(coord.x, coord.y)

            if ShouldStopUpgrading() {
                AddToLog("Found return to lobby, going back.")
                successfulCoordinates := []
                return keyFarmEnabled & keyFound ? LobbyLoop() : Replaying()
            }

            if IsMaxUpgrade() {
                AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                continue ; Skip to the next coordinate
            }

            Sleep(200)
            if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }
            BetterClick(565, 563) ; move mouse
            Reconnect()
        }

        ; If all units are maxed, still check for stopping condition
        if successfulCoordinates.Length = 0 {
            Reconnect()
            BetterClick(720, 510)
            if ShouldStopUpgrading() {
                AddToLog("Stopping due to finding return to lobby button.")
                return keyFarmEnabled & keyFound ? LobbyLoop() : Replaying()
            }
            Sleep(2000) ; Prevent excessive looping

        }

        Reconnect()
    }
}


UpgradeUnit(x, y) {
    BetterClick(x, (y - 3))
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
}

IsMaxUpgrade() {
    Sleep 500
    if (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade2)) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade3)))
    {
        return true
    }
}

ShouldStopUpgrading(sleepamount := 300) {
    Sleep sleepamount
    if CheckForReplayButton() {
        if (WebhookCheckbox.Value = 1) {
            SendWebhook()
        }
        if (keyFarmEnabled && keyFound) {
            BetterClick(376, 117) ;Click Lobby
        } else {
            BetterClick(485, 115) ;Click Replay
        }
        return true
    }
}

OnSpawn() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    OnSpawnSetup()
}

LookDown() {
    MouseMove(400, 300)
    Sleep 100

    ; Zoom in smoothly
    Loop 10 {
        Send "{WheelUp}"
        Sleep 50
    }

    ; Look down
    Click
    MouseMove(400, 400)  ; Move mouse down to angle camera down
    
    ; Zoom back out smoothly
    Loop 20 {
        Send "{WheelDown}"
        Sleep 50
    }
    
    ; Move mouse back to center
    MouseMove(400, 300)
}

LoadedLoop() {
    AddToLog("Waiting to load in")
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            AddToLog("Loaded in")
            Sleep 1000
            break
        }
        Reconnect()
    }
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        AddToLog("Sending chat")
        SendChat()
    }
}

PressVoteStart() {
    sleep 1000
    BetterClick(350, 103) ; click yes
    BetterClick(350, 100) ; click yes
    BetterClick(350, 97) ; click yes
}

StartedLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            continue
        }
        AddToLog("Game started, waiting 6s for income")
        Sleep(6000)
        break
    }
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
        {
            break
        }
        Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    {
        return true
    }
}

Checkforloss(){
    if (ok:=FindText(&X, &Y, 412-150000, 109-150000, 412+150000, 109+150000, 0, 0, DeathText))
    {
        return true
    }
    return false
}

CheckForReplayButton() {
    IsFound := CheckforNextButton()
    if !IsFound {
        return false
    }
    if (ok :=FindText(&X, &Y, 435-150000, 168-150000, 435+150000, 168+150000, 0, 0, keyFound ? LobbyText : ReplayText)) {
        return true
    }
    return false
}

CheckforNextButton() {
    NextButton:="|<>*124$49.70s000007ly0003s6AnU001y33Mk001X1VwNyCClkkSDzzjsyM77UQyM3A1XU4C81a0lU3040n40llk7VtX0M0w7lslkA0S3swMs6Dy0wCQS30C0C1yDVk277Uz7sw3bnszzzzzzzzzzzzzzzzzU"

    if (ok:=FindText(&X, &Y, 355-150000, 441-150000, 355+150000, 441+150000, 0, 0, NextButton)) {
        AddToLog("Found button, checking for replay next")
        loop 5 {
            BetterClick(348, 391) ; next
            Sleep 200
        }
        Sleep 2000
        return true
    }
    return false
}

SendChat() {
    SendInput("/")
    Sleep 250
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        for char in StrSplit(chat) {
            Send(char)
            Sleep(Random(100, 200))  ; Optional delay between each keypress
        }
    }
    Sleep 1200
    SendInput("{Enter}")
    Sleep 250
}


SortByPriority(&array, priorityMapping) {
    AddToLog("Starting unit sorting by priority mapping")
    sortedArray := []

    for index, slot in priorityMapping {
        foundSlot := false

        for i, item in array {
            if (item.slot = slot) {
                sortedArray.Push(item)
                foundSlot := true
            }
        }

        if !foundSlot {
            AddToLog("No units found for: " slot ". Moving onto next slot")
        }
    }

    array := sortedArray
    AddToLog("Finished sorting units, starting upgrading")
}

TPtoSpawn() {
    BetterClick(26, 570) ;click settings
    Sleep 300
    BetterClick(400, 215)
    Sleep 300
    loop 4 {
        Sleep 150
        SendInput("{WheelDown 1}") ;scroll
    }
    Sleep 300
    if (ok := FindText(&X, &Y, 215, 160, 596, 480, 0, 0, Spawn)) {
        AddToLog("Found Teleport to Spawn button")
        BetterClick(X + 50, Y - 30)
    } else {
        AddToLog("Could not find Teleport button")
    }
    Sleep 300
    BetterClick(583, 147)
    Sleep 300
}

DebugOCR() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
}

AntiCaptcha() {
    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    ; Display OCR results
    if ocrResult {
        BetterClick(414, 342) ; Click to focus on captcha input
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 6000
    if (ok:=FindText(&X, &Y, 175-150000, 186-150000, 175+150000, 186+150000, 0, 0, LoadingScreen)) {
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }
    AddToLog("Walking to ensure the UI pops up again if it didnt matchmake")

    loop 2 {
        HoldKey("D", 400)
        HoldKey("A", 800)
        HoldKey("Space", 2000)
    }

    Sleep 1500
    if (ok := FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI))
    {
        AddToLog("Waiting for captcha cooldown then retrying")
        Sleep 6000
    }
    return
}

OnSpawnSetup() {
    SendInput ("{Tab}")
    LookDown()
    Sleep 200
    TPtoSpawn()
    Sleep 200
    loop {
        if PixelSearch(&Px, &Py, 558, 335, 694, 369, keyFarmEnabled && keyFound ? 0x1D1414 : 0x1E1820, 3) { ;Credit zredlohtop for updating the colors
            AddToLog("Correct Angle")
            break
        }
        else {
            AddToLog("Incorrect Angle. Turning again.")
            SendInput ("{Left up}")
            Sleep 200
            SendInput ("{Left down}")
            Sleep 750
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for key to be fully processed
        }
    }

    SendInput ("{d up}")
    Sleep 100
    SendInput ("{d down}")
    Sleep 5000
    SendInput ("{d up}")
    KeyWait "d"
}

Reconnect() {
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 1000
        }
        loop {
            AddToLog("Reconnecting to Roblox...")
            Sleep 15000
            if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                AddToLog("Reconnected Succesfully!")
                return GoToRaids() ; Check for challenges in the lobby
            }
            else {
                Reconnect()
            }
        }
    }
}

HoldKey(key, duration) {
    SendInput ("{" key "up}")
    ; go to teleporter
    Sleep 100
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}

FindAndClickColor(targetColor := (0x091512), searchArea := [0, 0, A_ScreenWidth, A_ScreenHeight]) {
    ; Extract the search area boundaries
    x1 := searchArea[1], y1 := searchArea[2], x2 := searchArea[3], y2 := searchArea[4]

    ; Perform the pixel search
    if (PixelSearch(&foundX, &foundY, x1, y1, x2, y2, targetColor, 0)) {
        ; Color found, click on the detected coordinates
        ;BetterClick(foundX, foundY, "Right")
        AddToLog("Color found and clicked at: X" foundX " Y" foundY)
        return true

    }
}

IsMaxed(coord) {
    global maxedCoordinates
    for _, maxedCoord in maxedCoordinates {
        if (maxedCoord.x = coord.x && maxedCoord.y = coord.y) {
            return true
        }
    }
    return false
}

PlacementTimerSleep() { ; Added for custom dropdown support
    if (unitPlacementDelay = 1) {
        Sleep 1500
    }
    if (unitPlacementDelay = 2) {
        Sleep 2000
    }
    if (unitPlacementDelay = 3) {
        Sleep 2500
    }
    if (unitPlacementDelay = 4) {
        Sleep 3000
    }
}

UpgradeUnitsNew() {
    if UUPCheckbox.Value = 1 {
        global successfulCoordinates, maxedCoordinates, unitUpgradePrioritydropDowns
        AddToLog("Beginning prioritized unit upgrades.")

        priorityMapping := []
        for index, dropDown in unitUpgradePrioritydropDowns {
            priorityText := dropDown.Text
            if priorityText && priorityText != "" {
                priorityMapping.Push(priorityText)
            }
        }

        SortByPriority(&successfulCoordinates, priorityMapping)

        for coord in successfulCoordinates {
            if IsMaxed(coord) {
                AddToLog("Unit already maxed at: X" coord.x " Y" coord.y ". Skipping upgrade.")
                continue
            }
            while !IsMaxUpgrade() {
                UpgradeUnit(coord.x, coord.y)
                if (IsMaxUpgrade()) {
                    break
                }
                if ShouldStopUpgrading() {
                    AddToLog("Found return to lobby, going back.")
                    successfulCoordinates := []
                    maxedCoordinates := []
                    return LobbyLoop()
                }

                Sleep(200)

                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) {
                    BetterClick(373, 237)
                }

                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                Reconnect()
            }

            if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }

            BetterClick(565, 563) ; move mouse
            AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y ". Moving onto next unit")
            maxedCoordinates.Push(coord)
        }

        AddToLog("All units upgraded or maxed.")
        while !ShouldStopUpgrading() {
                BetterClick(348, 391) ; next
                Sleep(200)
        }

        return LobbyLoop()
    }
    else
    {
        global successfulCoordinates
        global maxedCoordinates

        AddToLog("Beginning unit upgrades.")

        while true { ; Infinite loop to ensure continuous checking
            for index, coord in successfulCoordinates {

                UpgradeUnit(coord.x, coord.y)

                if ShouldStopUpgrading() {
                    AddToLog("Found return to lobby, going back.")
                    successfulCoordinates := []
                    maxedCoordinates := []
                    return LobbyLoop()
                }

                if IsMaxUpgrade() {
                    AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                    maxedCoordinates.Push(successfulCoordinates.Get(index))
                    successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                    continue ; Skip to the next coordinate
                }

                Sleep(200)
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                Reconnect()
            }

            ; If all units are maxed, still check for stopping condition
            if successfulCoordinates.Length = 0 and maxedCoordinates.Length > 0 {
                Reconnect()
                BetterClick(348, 391) ; next
                if ShouldStopUpgrading() {
                    AddToLog("Stopping due to finding return to lobby button.")
                    return LobbyLoop()
                }
                Sleep(2000) ; Prevent excessive looping

            }

            Reconnect()
        }
    }
}