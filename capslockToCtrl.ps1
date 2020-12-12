<#
    This is a Windows10 script to change the keyboard layout : while pressing Caps Lock, send the Left Ctrl code.
    Need to be run as administrator.
#>

$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);


<#
; source : https://superuser.com/questions/949385/
; The hex data is in five groups of four bytes:
;   00,00,00,00,\    header version (always 00000000)
;   00,00,00,00,\    header flags (always 00000000)
;   04,00,00,00,\    # of entries (3 in this case) plus a NULL terminator line.
;                    Entries are in 2-byte pairs: Key code to send & keyboard key to send it.
;                    Each entry is in LSB, MSB order.
;   1d,00,3a,00,\    Send LEFT CTRL (0x001d) code when user presses the CAPS LOCK key (0x003a) 
;   38,00,1d,00,\    Send LEFT ALT (0x0038) code when user presses the LEFT CTRL key (0x001d) 
;   3a,00,38,00,\    Send CAPS LOCK (0x3A) code when user presses the LEFT ALT key (0x0038) 
;   00,00,00,00      NULL terminator
#>