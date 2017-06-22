#include <Constants.au3>
#include <Date.au3>
#include <ImageSearch.au3>
#include <Array.au3>

;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon at autoitscript dot com)
;
; Script Function:
;   Opens Notepad, types in some text and then quits the application.
;

; vào tầng 3
; vào vị trí 1
; -> mở bản đồ
; -> click tọa độ 1
; -> click chuột trái lên tọa độ cây cờ 1
; -> tự đánh chờ boss
; -> phát hiện boss
; -> lưu time
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
; đến vị trí 2
; -> mở bản đồ or tọa độ
; -> click chuột lên cây cờ
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
; đến vị trí 3
; -> lặp vị trí 2
; lặp đến vị trí 10

; vào tầng 2
; -> lặp bước tầng 3

; vào tầng 1
; -> lặp bước tầng 3

; out
; -> de bien kinh
; -> ngồi thiền
; -> chờ đến time + 15'
; -> vào lại tầng 3

#b_color1 = 0x93080B
#b_color2 = 0x92080B

$b_left_x = 720
$b_left_y = 342
$b_right_x = 771
$b_right_y = 321

$td1_x = 772
$td1_y = 365
$f1_x = 770
$f1_y = 319

$td2_x = 892
$td2_y = 405
$f2_x = 890
$f2_y = 360

$td3_x = 961
$td3_y = 486
$f3_x = 956
$f3_y = 443

$td4_x = 1065
$td4_y = 438
$f4_x = 1063
$f4_y = 393

$td5_x = 1155
$td5_y = 554
$f5_x = 1151
$f5_y = 507

$td6_x = 1076
$td6_y = 599
$f6_x = 1075
$f6_y = 557

$td7_x = 997
$td7_y = 644
$f7_x = 994
$f7_y = 598

$td8_x = 883
$td8_y = 679
$f8_x = 879
$f8_y = 632

$td9_x = 806
$td9_y = 629
$f9_x = 805
$f9_y = 589

$td10_x = 971
$td10_y = 756
$f10_x = 971
$f10_y = 714

$icon_tl1_x= 1205
$icon_tl1_y = 293
$icon_tl2_x = 1304
$icon_tl2_y = 274

$title_chrome = 'Võ Lâm Truyền Kỳ Web - Google Chrome'
$title_m_edge = 'Võ Lâm Truyền Kỳ Web ‎- Microsoft Edge'
$w_class = '[Classnn:ApplicationFrameInputSinkWindow1]'

Func jpos()
   $jpos = MouseGetPos()
   MsgBox(0, "Tọa độ chuột x,y:", $jpos[0] & "," & $jpos[1])
EndFunc

Func run_boss($td_x, $td_y, $f_x, $f_y)
   ; -> mở bản đồ
   Call('open_map')
   ; -> click tọa độ
   $r = MouseClick('left', $td_x, $td_y)
   Sleep(1000)
   ; -> click chuột trái lên tọa độ cây cờ
   $r = MouseClick('left', $f_x, $f_y)
   ; -> đóng bản đồ
   Call('open_map')
   ; -> tự đánh chờ boss (1 or 2s)

   ; -> phát hiện boss
   ; -> đánh boss
   ; -> chờ boss chết ???
   ; -> chờ 1 or 2s nhặt đồ
EndFunc

Global $b_found = False

Func reset_b_found()
   $b_found = False
EndFunc

Global $map_x = 1401, $map_y = 111

Func open_map()
   $r = MouseClick('left', $map_x, $map_y)
EndFunc

Global $close_x = 0, $close_y = 0
Func kill_boss()
   ; khi boss chưa xuất hiện
   While 1

	  Local $btn_close = _ImageSearch(@ScriptDir&'\dungngay.jpg', 1, $close_x, $close_y, 0)
	  If $btn_close = 1 Then
		 MsgBox('','','found')
		 MouseClick("left", $close_x, $close_y)
	  EndIf

	  $b = PixelSearch($b_left_x,$b_left_y,$b_right_x,$b_right_y, 0xFFFEE9)
	  Sleep(500)
	  ; -> đánh boss
	  If Not @error and IsArray($b) Then
		 $b_found = True
		 MsgBox('','','found')
		 MsgBox('','',"X and Y are: " & $b[0] & "," & $b[1])
		 Sleep(500)
		 MouseClick("left", $b[0], $b[1], 1, 0)
		 Sleep(500)
		 ; -> đánh boss
		 Send('{z}')

		 ; -> chờ boss chết ???
		 Sleep(10000)

		 ; -> chờ 1 or 2s nhặt đồ
		 Sleep(3000)

		 ExitLoop
	  EndIf
   WEnd
EndFunc

; Thoát chương trình
Func ExitApp()
   Exit
EndFunc

Func go()
   ; vào tầng 3
   WinActivate($title_m_edge)
   $r = MouseClick('left', $icon_tl2_x, $icon_tl2_y)
   Sleep(1000)
EndFunc

Func start()

   ; vào tầng
   ; vào tầng 3
   WinActivate($title_m_edge)
   Sleep(1000)

   Call('reset_b_found')

   ; vào vị trí 1
   Call("run_boss", $td1_x, $td1_y, $f1_x, $f1_y)
   Sleep(10000)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')
   ; -> lưu time boss đầu
   $current_dt = _Now()

   ; đến vị trí 2
   Call("run_boss", $td2_x, $td2_y, $f2_x, $f2_y)
   ; kill boss
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 3
   Call("run_boss", $td3_x, $td3_y, $f3_x, $f3_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 4
   Call("run_boss", $td4_x, $td4_y, $f4_x, $f4_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 5
   Call("run_boss", $td5_x, $td5_y, $f5_x, $f5_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 6
   Call("run_boss", $td6_x, $td6_y, $f6_x, $f6_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 7
   Call("run_boss", $td7_x, $td7_y, $f7_x, $f7_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 8
   Call("run_boss", $td8_x, $td8_y, $f8_x, $f8_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 9
   Call("run_boss", $td9_x, $td9_y, $f9_x, $f9_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

   ; đến vị trí 10
   Call("run_boss", $td10_x, $td10_y, $f10_x, $f10_y)
   ; kill boss
   Call('kill_boss')
   ; reset trạng thái boss sau khi kill xong
   Call('reset_b_found')

EndFunc

Call('start')