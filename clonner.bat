@echo off
:usb-not-connected

for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (            
            xcopy %%c\ "C:\Users\Usuario\copies\%date:~7,2%-%date:~3,2%-%date:~10,4%-%time:~0,2%-%time:~3,2%\" /E /Y
            
            
            :usb-connected
            timeout 1
            if %%d equ Removable (          
               goto usb-connected
            )
         )
      )
   )
)

timeout 1
goto usb-not-connected