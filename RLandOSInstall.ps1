#RLand OS Install V4
Read-Host -Prompt "Bienvenido al Instalador de RLand OS
By TheRodrike
Instale los Drivers y Consulte el Readme antes de Proceder con la Instalacion
Pulse Enter para Instalar"

#Variables
$title    = 'RLand OS'
$choices  = '&Yes', '&No'
$taskbar = 'Desea aplicar la personalizacion para la Taskbar?'
$apps = 'Desea revisar las apps recomendadas para Instalar?'
$dependencias = 'Desea Revisar las Dependencias (Se Recomienda Instalar Ambas)?'
$navsocial = 'Desea Revisar las Aplicaciones de Navegacion y Social?'
$gaming = 'Desea Revisar las Aplicaciones de Gaming?'
$multimedia = 'Desea Revisar las Aplicaciones de Multimedia?'
$productividad = 'Desea Revisar las Aplicaciones de Productividad?'
$personalizacion = 'Desea Revisar las Aplicaciones de Personalizacion?'
$rlanmeter = 'Desea Revisar RLanmeter (Rainmeter Skin)?'
$vcredistx64 = 'Desea Descargar VcRedist X64 (Dependencia)?'
$vcredistx86 = 'Desea Descargar VcRedist X86 (Dependencia)?'
$firefox = 'Desea Descargar Firefox Nigthly (Navegador)?'
$steam = 'Desea Descargar Steam (Plataforma)?'
$kodi = 'Desea Descargar Kodi (Reproductor Multimedia)?'
$discord = 'Desea Descargar Discord (Plataforma Social)?'
$vsc = 'Desea Descargar Visual Studio Code (Editor de Archivos)?'
$sonar = 'Desea Descargar Sonar (Audio Profesional)?'
$notion = 'Desea Descargar Notion (Ofimatica en la Nube)?'
$rainmeter = 'Desea Descargar Rainmeter (Widgets)?'
$playnite = 'Desea Descargar Playnite (Launcher)?'

#Directorios
Set-Location $env:USERPROFILE
New-Item -Path '.\RLandOS' -ItemType Directory -Force


#Personalizar
Invoke-WebRequest 'https://raw.githubusercontent.com/TheRodrike/RLandOS/master/RLandOS.jpg' -OutFile '.\RLandOS\RLandOS.jpg'
New-ItemProperty -Path 'HKCU:Control Panel\Desktop' -Name 'WallPaper' -Value "%USERPROFILE%\RLandOS\RLandOS.jpg" -PropertyType String -Force

$decision = $Host.UI.PromptForChoice($title, $taskbar, $choices, 0)
if ($decision -eq 0) {
    New-ItemProperty -Path 'HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarBadges' -Value "0" -PropertyType DWORD -Force
    New-ItemProperty -Path 'HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarSmallIcons' -Value "1" -PropertyType DWORD -Force
    New-ItemProperty -Path 'HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAcrylicOpacity' -Value "0" -PropertyType DWORD -Force
} else {
    Write-Host 'Your choice is No'
}

Read-Host -Prompt "Personalizacion Finalizada
Pulse Enter para continuar"

#Optimizar
Set-Service -name DiagTrack -startupType disabled
Set-Service -name SysMain -startupType disabled
Set-Service -name SCPolicySvc -startupType disabled
Set-Service -name WbioSrvc -startupType disabled
Set-Service -name DPS -startupType disabled
Set-Service -name WerSvc -startupType disabled
Set-Service -name SCardSvr -startupType disabled
Set-Service -name tapisrv -startupType disabled
Set-Service -name WalletService -startupType disabled

Read-Host -Prompt "Optimizacion Finalizada
Pulse Enter para continuar"

#Apps
$decision = $Host.UI.PromptForChoice($title, $apps, $choices, 0)
if ($decision -eq 0) {
    $decision = $Host.UI.PromptForChoice($title, $dependencias, $choices, 0)
    if ($decision -eq 0) {
        $decision = $Host.UI.PromptForChoice($title, $vcredistx64, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://aka.ms/vs/17/release/vc_redist.x64.exe'
        } else {
            Write-Host 'No'
        }

        $decision = $Host.UI.PromptForChoice($title, $vcredistx86, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://aka.ms/vs/17/release/vc_redist.x86.exe'
        } else {
            Write-Host 'No'
        }
    } else {
        Write-Host 'No'
    }

    $decision = $Host.UI.PromptForChoice($title, $navsocial, $choices, 0)
    if ($decision -eq 0) {
        $decision = $Host.UI.PromptForChoice($title, $firefox, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-central-l10n/Firefox%20Installer.es-ES.exe'
        } else {
            Write-Host 'No'
        }

        $decision = $Host.UI.PromptForChoice($title, $discord, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86'
        } else {
            Write-Host 'No'
        }
    } else {
        Write-Host 'No'
    }

    $decision = $Host.UI.PromptForChoice($title, $gaming, $choices, 0)
    if ($decision -eq 0) {
        $decision = $Host.UI.PromptForChoice($title, $steam, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe'
        } else {
            Write-Host 'No'
        }

        $decision = $Host.UI.PromptForChoice($title, $sonar, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://steelseries.com/gg/downloads/gg/latest/windows'
        } else {
            Write-Host 'No'
        }

        $decision = $Host.UI.PromptForChoice($title, $playnite, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://playnite.link/download/PlayniteInstaller.exe'
        } else {
            Write-Host 'No'
        }
    } else {
        Write-Host 'No'
    }

    $decision = $Host.UI.PromptForChoice($title, $multimedia, $choices, 0)
    if ($decision -eq 0) {
        $decision = $Host.UI.PromptForChoice($title, $kodi, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://kodi.tv/download/windows'
        } else {
            Write-Host 'No'
        }
    } else {
        Write-Host 'No'
    }

    $decision = $Host.UI.PromptForChoice($title, $productividad, $choices, 0)
    if ($decision -eq 0) {
        $decision = $Host.UI.PromptForChoice($title, $notion, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://notion.so/desktop/windows/download'
        } else {
            Write-Host 'No'
        }

        $decision = $Host.UI.PromptForChoice($title, $vsc, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user'
        } else {
            Write-Host 'No'
        }
    } else {
        Write-Host 'No'
    }

    $decision = $Host.UI.PromptForChoice($title, $personalizacion, $choices, 0)
    if ($decision -eq 0) {
        $decision = $Host.UI.PromptForChoice($title, $rainmeter, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://www.rainmeter.net/'
            $decision = $Host.UI.PromptForChoice($title, $rlanmeter, $choices, 0)
            if ($decision -eq 0) {
                Start-Process 'https://github.com/TheRodrike/RLanmeter'
            } else {
            Write-Host 'No'
            }
        } else {
            Write-Host 'No.'
        }
    } else {
        Write-Host 'No'
    }
} else {
    Write-Host 'No'
}

Read-Host -Prompt "Gracias por Instalar RLand OS
Pulse Enter para Reiniciar y Finalizar"

#Reiniciar
shutdown /r /t 0
