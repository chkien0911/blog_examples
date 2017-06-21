#include <Constants.au3>
#include <Date.au3>

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

$b = PixelSearch($b_left_x,$b_left_y,$b_right_x,$b_right_y,0x93080B)

$icon_tl1_x = 1205
$icon_tl1_y = 293
$icon_tl2_x = 1304
$icon_tl2_y = 274

$title_chrome = 'Võ Lâm Truyền Kỳ Web - Google Chrome'
$title_m_edge = 'Võ Lâm Truyền Kỳ Web ‎- Microsoft Edge'
$w_class = '[Classnn:ApplicationFrameInputSinkWindow1]'

; vào tầng 3
WinActivate($title_m_edge)
$r = MouseClick('left', $icon_tl2_x, $icon_tl2_y)
Sleep(1000)
; vào vị trí 1
; -> mở bản đồ
Send('{m}')
; -> click tọa độ 1
$r = MouseClick('left', $td1_x, $td1_y)
Sleep(1000)
; -> click chuột trái lên tọa độ cây cờ 1
$r = MouseClick('left', $f1_x, $f1_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss
; -> phát hiện bossm
; -> lưu time
$current_dt = _Now()
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(15000)

; đến vị trí 2
; -> mở bản đồ
Send('{m}')
; -> click tọa độ 2
$r = MouseClick('left', $td2_x, $td2_y)
Sleep(1000)
; -> click chuột trái lên tọa độ cây cờ 2
$r = MouseClick('left', $f2_x, $f2_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)

; đến vị trí 3
; -> mở bản đồ
Send('{m}')
; -> click tọa độ 3
$r = MouseClick('left', $td3_x, $td3_y)
Sleep(1000)
; -> click chuột trái lên tọa độ cây cờ 3
$r = MouseClick('left', $f3_x, $f3_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)

; đến vị trí 4
; -> mở bản đồ
Send('{m}')
; -> click tọa độ 4
$r = MouseClick('left', $td4_x, $td4_y)
Sleep(1000)
; -> click chuột trái lên tọa độ cây cờ 4
$r = MouseClick('left', $f4_x, $f4_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)

; đến vị trí 5
; -> mở bản đồ
Send('{m}')
$r = MouseClick('left', $td5_x, $td5_y)
Sleep(1000)
$r = MouseClick('left', $f5_x, $f5_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)


; đến vị trí 5
; -> mở bản đồ
Send('{m}')
$r = MouseClick('left', $td6_x, $td6_y)
Sleep(1000)
$r = MouseClick('left', $f6_x, $f6_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)

; đến vị trí 5
; -> mở bản đồ
Send('{m}')
$r = MouseClick('left', $td7_x, $td7_y)
Sleep(1000)
$r = MouseClick('left', $f7_x, $f7_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)

; đến vị trí 5
; -> mở bản đồ
Send('{m}')
$r = MouseClick('left', $td8_x, $td8_y)
Sleep(1000)
$r = MouseClick('left', $f8_x, $f8_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)

; đến vị trí 5
; -> mở bản đồ
Send('{m}')
$r = MouseClick('left', $td9_x, $td9_y)
Sleep(1000)
$r = MouseClick('left', $f9_x, $f9_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)

; đến vị trí 10
; -> mở bản đồ
Send('{m}')
$r = MouseClick('left', $td10_x, $td10_y)
Sleep(1000)
$r = MouseClick('left', $f10_x, $f10_y)
; -> đóng bản đồ
Send('{m}')
; -> tự đánh chờ boss (1 or 2s)
; -> phát hiện boss
; -> đánh boss
; -> chờ boss chết ???
; -> chờ 1 or 2s nhặt đồ
Sleep(5000)
