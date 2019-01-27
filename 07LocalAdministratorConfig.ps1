$HostPC = [System.Environment]::MachineName
$user = "Administrator"

$targetuser = [ADSI]("WinNT://{0}/{1}, user" -F $HostPC, $user)
$userFlags = $targetuser.Get("UserFlags")
$userFlags = $userFlags -bor 0x10000
$targetuser.Put("UserFlags", $userFlags)
$targetuser.SetInfo()
