@echo off
rem This file was created by pub v2.15.1.
rem Package: spider
rem Version: 2.1.0
rem Executable: spider
rem Script: main
if exist "C:\Users\Admin\AppData\Local\Pub\Cache\global_packages\spider\bin\main.dart-2.15.1.snapshot" (
  call dart "C:\Users\Admin\AppData\Local\Pub\Cache\global_packages\spider\bin\main.dart-2.15.1.snapshot" %*
  rem The VM exits with code 253 if the snapshot version is out-of-date.
  rem If it is, we need to delete it and run "pub global" manually.
  if not errorlevel 253 (
    goto error
  )
  dart pub global run spider:main %*
) else (
  dart pub global run spider:main %*
)
goto eof
:error
exit /b %errorlevel%
:eof

