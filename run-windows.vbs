Set objShell = WScript.CreateObject("WScript.Shell")

objShell.SendKeys "^{ESC}"

WScript.Sleep 1000

objShell.SendKeys WScript.Arguments.Item(0)

WScript.Sleep 1000

objShell.SendKeys "{ENTER}"
