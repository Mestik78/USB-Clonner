@echo off
:start

for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (            
            xcopy %%c\ "C:\Users\USER\copies\%date:~7,2%-%date:~3,2%-%date:~10,4%-%time:~0,2%-%time:~3,2%\" /E /Y
         )
      )
   )
)
timeout 1
goto start