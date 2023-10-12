#RLand OS Install V6
Read-Host -Prompt "Bienvenido al Instalador de RLand OS
By TheRodrike
Es Recomendable tener los drivers actualizados antes de continuar
Pulse Enter para Instalar"

#Variables
$title    = 'RLand OS'
$choices  = '&Yes', '&No'
$taskbar = 'Desea aplicar la personalizacion para la Taskbar?'
$apps = 'Desea revisar las apps recomendadas para Instalar?'
$navsocial = 'Desea Revisar las Aplicaciones de Navegacion y Social?'
$gaming = 'Desea Revisar las Aplicaciones de Gaming?'
$multimedia = 'Desea Revisar las Aplicaciones de Multimedia?'
$productividad = 'Desea Revisar las Aplicaciones de Productividad?'
$custom = 'Desea Revisar las Aplicaciones de Personalizacion?'
$firefox = 'Desea Descargar Firefox Nigthly (Navegador)?'
$steam = 'Desea Descargar Steam (Plataforma de Juegos)?'
$kodi = 'Desea Descargar Kodi (Reproductor Multimedia)?'
$discord = 'Desea Descargar Discord (Chats)?'
$vsc = 'Desea Descargar Visual Studio Code (Editor de Archivos)?'
$sonar = 'Desea Descargar Sonar (Audio Profesional)?'
$notion = 'Desea Descargar Notion (Ofimatica en la Nube)?'
$playnite = 'Desea Descargar Playnite (Launcher)?'
$7zip= 'Desea Descargar 7zip (Archivos Comprimidos)?'
$we = 'Desea Revisar Wallpaper Engine (Desktop) (De Pago)?'

#Directorios
Set-Location $env:USERPROFILE
New-Item -Path '.\RLandOS' -ItemType Directory -Force

#Personalizar
Invoke-WebRequest 'https://raw.githubusercontent.com/TheRodrike/RLandOS/main/RLandOS/RLandOS.jpg' -OutFile '.\RLandOS\RLandOS.jpg'
New-ItemProperty -Path 'HKCU:Control Panel\Desktop' -Name 'WallPaper' -Value "%USERPROFILE%\RLandOS\RLandOS.jpg" -PropertyType String -Force

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

Read-Host -Prompt "Configuracion del Sistema Finalizada
Pulse Enter para Continuar"

#Dependencias
Read-Host -Prompt "Pulse Enter para Descargar Ambas Dependencias"

Start-Process 'https://aka.ms/vs/17/release/vc_redist.x64.exe'

Read-Host -Prompt "Pulse Enter para Descargar la Siguiente Dependencia"

Start-Process 'https://aka.ms/vs/17/release/vc_redist.x86.exe'

#Apps
$decision = $Host.UI.PromptForChoice($title, $apps, $choices, 0)
if ($decision -eq 0) {
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
        $decision = $Host.UI.PromptForChoice($title, $7zip, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://www.7-zip.org/download.html'
        } else {
            Write-Host 'No'
        }
    } else {
        Write-Host 'No'
    }
    $decision = $Host.UI.PromptForChoice($title, $custom, $choices, 0)
    if ($decision -eq 0) {
        $decision = $Host.UI.PromptForChoice($title, $we, $choices, 0)
        if ($decision -eq 0) {
            Start-Process 'https://store.steampowered.com/app/431960/Wallpaper_Engine/'
        } else {
            Write-Host 'No'
        }
        Read-Host -Prompt "Puedes Personalizar la Taskbar Instalando TranslucentTB
        Consulte el Readme si le Interesa esta Opcion
        Pulse Enter Continuar"
    } else {
        Write-Host 'No'
    }
} else {
    Write-Host 'No'
}

#Finalizar
Read-Host -Prompt "Gracias por Instalar RLand OS
Pulse Enter para Finalizar"

#Reiniciar
shutdown /r /t 0
