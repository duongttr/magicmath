#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Sound.au3>
#include <WinAPIGdi.au3>
FileInstall('fontawesome.ttf', @TempDir & '\fontawesome.ttf', 1)
_WinAPI_AddFontResourceEx(@TempDir & '\fontawesome.ttf', $FR_PRIVATE)
Global $so_hang[2], $phep_tinh, $answer, $QUES, $COUNT_TIMER, $SCORE = 0, $FILE_DATA = @ScriptDir & "\Data\data.ini", $NOQ = 1, $WAIT = False, $NAME
$NAME = InputBox("User Name", "Mời bạn nhập tên vào ô bên dưới!")
If @error = 1 Then Exit
_MagicMath()
Func _MagicMath()
	#Region ### START Koda GUI section ### Form=
	$GUI = GUICreate("Magic Math", 727, 376, -1, -1, $WS_POPUP)
	GUISetBkColor(0xFFFFFF)
	Global $Label1 = GUICtrlCreateLabel("MAGIC MATH", 0, -2, 727, 58, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetFont(-1, 20, 800, 0, "Segoe UI Black")
	GUICtrlSetBkColor(-1, 0x006633)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetState(-1, $GUI_ENABLE)
	Global $Label2 = GUICtrlCreateLabel("DỄ NHƯNG KHÔNG DỄ, KHÓ NHƯNG KHÔNG KHÓ", 0, 32, 732, 25, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Segoe UI Light")
	GUICtrlSetBkColor(-1, 0x006633)
	GUICtrlSetColor(-1, 0xFFFFFF)
	Global $START = GUICtrlCreateLabel("BẮT ĐẦU", 208, 160, 292, 40, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x006633)
	GUICtrlSetFont(-1, 18, 800, 0, "Segoe UI")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	Global $HIGH_SCORE = GUICtrlCreateLabel("ĐIỂM CAO NHẤT", 208, 216, 292, 40, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x006633)
	GUICtrlSetFont(-1, 18, 800, 0, "Segoe UI")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	Global $RULE = GUICtrlCreateLabel("LUẬT CHƠI", 208, 272, 292, 40, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x006633)
	GUICtrlSetFont(-1, 18, 800, 0, "Segoe UI")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	Global $EXIT = GUICtrlCreateLabel("THOÁT", 208, 328, 292, 40, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x006633)
	GUICtrlSetFont(-1, 18, 800, 0, "Segoe UI")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	Global $HELLO_ACC = GUICtrlCreateLabel("Label7", 0, 80, 727, 54, $SS_CENTER)
	GUICtrlSetFont(-1, 28, 800, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, 0x006633)

	Global $QUES = GUICtrlCreateLabel("Label8", 0, 140, 727, 54, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 35, 800, 0, "Segoe UI Black")
	GUICtrlSetColor(-1, 0x006633)

	Global $RULE_WIN = GUICtrlCreateLabel("Label8", 0, 140, 727, 54, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 35, 800, 0, "Segoe UI Black")
	GUICtrlSetColor(-1, 0x006633)

	Global $TEXT_GV = GUICtrlCreateLabel("Game Over :(", 0, 140, 727, 54, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 35, 800, 0, "Segoe UI Black")
	GUICtrlSetColor(-1, 0x006633)

	Global $WRONG_BTT = GUICtrlCreateLabel("", 368, 288, 364, 89, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 60, 800, 0, "FontAwesome")
	GUICtrlSetBkColor(-1, 0xFF3333)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	Global $CHECK_BTT = GUICtrlCreateLabel("", 0, 288, 370, 89, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 60, 800, 0, "FontAwesome")
	GUICtrlSetBkColor(-1, 0x1FA67A)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	Global $TASKBAR_TIMER = GUICtrlCreateLabel("", 727, 57, 727, 9, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x219CED)

	Global $TEXT = GUICtrlCreateLabel("Chương trình sẽ tạo cho bạn một phép tính và một kết quả ngẫu nhiên. Nếu kết quả của phép tính bằng với kết quả ngẫu nhiên mà chương trình đã tạo ra, bạn hãy nhanh chóng nhấn vào button Đúng (Button màu xanh lá) và ngược lại." & @CRLF & "Mỗi câu hỏi sẽ có 2 giây để trả lời, độ khó của câu hỏi sẽ tăng dần theo số điểm." & @CRLF & "Chúc bạn chơi game vui vẻ ^^!!" & @CRLF & "Source: leechinthang12@gmail.com", 0, 200, 727, 170, $SS_CENTER)
	GUICtrlSetFont(-1, 15, 400, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, 0x006633)

	Global $BACK_BUTTON = GUICtrlCreateLabel("", 15, 70, 732, 25)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetColor(-1, 0x006633)
	GUICtrlSetCursor(-1, 0)
	Global $BACK_FROM_GV = GUICtrlCreateLabel("BACK", 250, 264, 209, 67, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 26, 400, 0, "Segoe UI")
	GUICtrlSetBkColor(-1, 0x006633)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	WinSetTrans($GUI, "", 0)
	Global $AUTHOR = GUICtrlCreateLabel("Thông tin tác giả", 555, 340, 175, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 13, 800, 0, "Segoe UI")
	GUICtrlSetBkColor($AUTHOR, 0x3399FF)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetCursor(-1, 0)
	GUISetState(@SW_SHOW, $GUI)


	GUICtrlSetState($TEXT_GV, $GUI_HIDE)
	GUICtrlSetState($QUES, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($CHECK_BTT, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($WRONG_BTT, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($TASKBAR_TIMER, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($RULE_WIN, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($TEXT, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($BACK_BUTTON, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($BACK_FROM_GV, $GUI_HIDE) ; _HIDE
	If $NAME <> "" Then
		GUICtrlSetData($HELLO_ACC, "Hi " & $NAME & ",")
	Else
		GUICtrlSetData($HELLO_ACC, "Hi unnamed,")
	EndIf ; CHANGE DATA

	#EndRegion ### END Koda GUI section ###
	For $i = 1 To 255 Step 5
		WinSetTrans($GUI, "", $i)
		Sleep(5)
	Next
	While 1
		Local $LAST_SCORE = IniRead($FILE_DATA, "DATA", "HIGHSCORE", 0)
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $AUTHOR
				MsgBox(64, "Author", "Tác giả: Dương Trần (fb.me/DuongTran.Org)" & @CRLF & "Xem source tại: doi-mat-blog-blogspot.com")
			Case $BACK_FROM_GV
				RE()
			Case $START
				Sleep(500)
				GUICtrlSetState($AUTHOR, $GUI_HIDE)
				GUICtrlSetBkColor($CHECK_BTT, 0x1FA67A)
				GUICtrlSetBkColor($WRONG_BTT, 0xFF3333)
				GUICtrlSetState($CHECK_BTT, $GUI_ENABLE)
				GUICtrlSetState($WRONG_BTT, $GUI_ENABLE)
				GUICtrlSetColor($QUES, 0x006633)
				GUICtrlSetPos($TASKBAR_TIMER,727)
				GUICtrlSetState($AUTHOR, $GUI_HIDE) ; HIDE
				GUICtrlSetState($HELLO_ACC, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($START, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($HIGH_SCORE, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($RULE, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($EXIT, $GUI_HIDE) ; _HIDE

				GUICtrlSetState($QUES, $GUI_SHOW) ; SHOW
				GUICtrlSetState($CHECK_BTT, $GUI_SHOW) ; SHOW
				GUICtrlSetState($WRONG_BTT, $GUI_SHOW) ; SHOW
				GUICtrlSetState($TASKBAR_TIMER, $GUI_SHOW) ; SHOW
				$NOQ = 1
				$SCORE = 0
				GUICtrlSetData($Label2, "Câu hỏi hiện tại: " & $NOQ & " - Số điểm: " & $SCORE) ; CHANGE DATA
				_QUES()
			Case $EXIT
				For $i = 255 To 0 Step -5
					WinSetTrans($GUI, "", $i)
					Sleep(5)
				Next
				Exit
			Case $RULE
				GUICtrlSetState($HELLO_ACC, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($START, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($HIGH_SCORE, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($RULE, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($EXIT, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($RULE_WIN, $GUI_SHOW) ; SHOW
				GUICtrlSetState($TEXT, $GUI_SHOW) ; SHOW
				GUICtrlSetState($BACK_BUTTON, $GUI_SHOW) ; SHOW

				GUICtrlSetData($RULE_WIN, "LUẬT CHƠI")
			Case $HIGH_SCORE
				MsgBox(64, "Điểm cao nhất", "Điểm cao nhất của bạn là: " & IniRead($FILE_DATA, "DATA", "HIGHSCORE", 0))
			Case $BACK_BUTTON
				GUICtrlSetState($HELLO_ACC, $GUI_SHOW) ; SHOW
				GUICtrlSetState($START, $GUI_SHOW) ; SHOW
				GUICtrlSetState($HIGH_SCORE, $GUI_SHOW) ; SHOW
				GUICtrlSetState($RULE, $GUI_SHOW) ; SHOW
				GUICtrlSetState($EXIT, $GUI_SHOW) ; SHOW
				GUICtrlSetState($RULE_WIN, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($TEXT, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($BACK_BUTTON, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($RULE_WIN, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($BACK_BUTTON, $GUI_HIDE) ; _HIDE
				GUICtrlSetState($RULE_WIN, $GUI_HIDE) ; _HIDE
			Case $CHECK_BTT
				If (Execute($so_hang[0] & $phep_tinh & $so_hang[1]) = $answer And $CHECK_BTT = $nMsg) Then
					$SCORE += 1
					$NOQ += 1
					$WAIT = True
					SoundPlay(@ScriptDir & "\Data\ding.mp3", 0)
					If $SCORE > $LAST_SCORE Then
						IniWrite($FILE_DATA, "DATA", "HIGHSCORE", $SCORE)
					EndIf
					GUICtrlSetData($Label2, "Câu hỏi hiện tại: " & $NOQ & " - Số điểm: " & $SCORE) ; CHANGE DATA
					GUICtrlSetPos($TASKBAR_TIMER, 0)
					_QUES()
				Else
					_GameOver()
				EndIf
			Case $WRONG_BTT
				If (Execute($so_hang[0] & $phep_tinh & $so_hang[1]) <> $answer And $WRONG_BTT = $nMsg) Then
					$SCORE += 1
					$NOQ += 1
					$WAIT = True
					SoundPlay(@ScriptDir & "\Data\ding.mp3", 0)
					If $SCORE > $LAST_SCORE Then
						IniWrite($FILE_DATA, "DATA", "HIGHSCORE", $SCORE)
					EndIf
					GUICtrlSetData($Label2, "Câu hỏi hiện tại: " & $NOQ & " - Số điểm: " & $SCORE) ; CHANGE DATA
					GUICtrlSetPos($TASKBAR_TIMER, 0)
					_QUES()
				Else
					_GameOver()
				EndIf
		EndSwitch
		If $WAIT = True Then
			GUICtrlSetPos($TASKBAR_TIMER, Default, Default, (TimerDiff($COUNT_TIMER) * 727) / 2000, Default)
			_TIMER()
		EndIf
	WEnd
EndFunc   ;==>_MagicMath

Func _QUES()
	$phep_tinh = StringSplit("+-", "")[Random(1, 2, 1)]
	If $phep_tinh = "+" Then
		$so_hang[0] = Random(1 + $SCORE, 3 + $SCORE, 1)
		$so_hang[1] = Random(1 + $SCORE, 3 + $SCORE, 1)
		$answer = Random(($so_hang[0] + $so_hang[1]) - 2, ($so_hang[0] + $so_hang[1]), 1)
		If $answer < 0 Then $answer = 0
	ElseIf $phep_tinh = "-" Then
		While 1
			$so_hang[0] = Random(1 + $SCORE, 3 + $SCORE, 1)
			$so_hang[1] = Random(1 + $SCORE, 3 + $SCORE, 1)
			If $so_hang[0] >= $so_hang[1] Then ExitLoop
			If $so_hang[0] < $so_hang[1] Then ContinueLoop
		WEnd
		$answer = Random(($so_hang[0] - $so_hang[1]) - 2, ($so_hang[0] - $so_hang[1]), 1)
		If $answer < 0 Then $answer = 0
	EndIf
	GUICtrlSetData($QUES, $so_hang[0] & $phep_tinh & $so_hang[1] & "=" & $answer)

	$COUNT_TIMER = TimerInit()
EndFunc   ;==>_QUES
Func _TIMER()
	If $COUNT_TIMER <> 0 Then
		If TimerDiff($COUNT_TIMER) > 2000 Then
			_GameOver()
		EndIf
	EndIf
EndFunc   ;==>_TIMER
Func _GameOver()
	GUICtrlSetBkColor($CHECK_BTT, 0x666666)
	GUICtrlSetBkColor($WRONG_BTT, 0x666666)
	GUICtrlSetState($CHECK_BTT, $GUI_DISABLE)
	GUICtrlSetState($WRONG_BTT, $GUI_DISABLE)
	GUICtrlSetColor($QUES, 0xFF3333)
	Sleep(3000)
	SoundPlay(@ScriptDir & "\Data\gameover.mp3")
	GUICtrlSetState($BACK_FROM_GV, $GUI_SHOW) ; SHOW
	GUICtrlSetState($QUES, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($CHECK_BTT, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($WRONG_BTT, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($TASKBAR_TIMER, $GUI_HIDE) ; _HIDE
	GUICtrlSetState($TEXT_GV, $GUI_SHOW)
	GUICtrlSetData($Label2, "DỄ NHƯNG KHÔNG DỄ, KHÓ NHƯNG KHÔNG KHÓ") ; CHANGE DATA
	$WAIT = False
EndFunc   ;==>_GameOver
Func RE()
	GUICtrlSetState($TEXT_GV, $GUI_HIDE)
	GUICtrlSetState($BACK_FROM_GV, $GUI_HIDE)
	GUICtrlSetState($HELLO_ACC, $GUI_SHOW) ; SHOW
	GUICtrlSetState($START, $GUI_SHOW) ; SHOW
	GUICtrlSetState($HIGH_SCORE, $GUI_SHOW) ; SHOW
	GUICtrlSetState($RULE, $GUI_SHOW) ; SHOW
	GUICtrlSetState($EXIT, $GUI_SHOW) ; SHOW
	GUICtrlSetState($AUTHOR, $GUI_SHOW)
					GUICtrlSetPos($TASKBAR_TIMER, 0)
	_QUES()
EndFunc   ;==>RE
