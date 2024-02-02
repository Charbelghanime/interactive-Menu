@echo off
echo welcome to the Menu System. Please proceed by typing an option from the list below
echo 1. View the system information
echo 2. Do some file operations
echo 3. Do some network operations
echo 4. Do some process management
echo 5. Do some data analysis
echo 6. Exit the program
set /p input= Enter a number here:

rem after typing a number you will be redirected to the label whwere you can choose some features depending on the number typed
if %input%==1 goto system
if %input%==2 goto file
if %input%==3 goto network
if %input%==4 goto process
if %input%==5 goto data
if %input%==6 goto end

:system

echo Choose the feature that you want to use
echo 1. View the operating system information
echo 2. View the available memory
echo 3. Check how many processors are installed
echo 4. Display the version of the operating system
echo 5. Display the current date
echo 6. Display the current time
echo 7.  Display TCP/IP network configuration information
echo 8.  Get information about the disk drives installed on the computer
echo 9.  Display the host name portion of the full computer name
echo 10.  Get basic information about the computer caption, codeset, buildnumber

set /p input= Enter a number here: 

if %input%==1 systeminfo & goto :end
if %input%==2 systeminfo |find "Available Physical Memory" & goto :end
if %input%==3 systeminfo |find "Processor" & goto :end
if %input%==4 ver & goto :end
if %input%==5 date /t & goto :end
if %input%==6 time /t & goto :end
if %input%==7 ipconfig /all & goto :end
if %input%==8 wmic logicaldisk get caption,description,filesystem & goto :end
if %input%==9 hostname & goto :end
if %input%==10 wmic os get caption, codeset, buildnumber & goto :end

:file

echo Choose the feature that you want to use

echo 1. Display the content of this directory
echo 2. Display the content of the directory in a tree structure
echo 3. Move a file to another directory
echo 4. Display file information
echo 5. Display the file attributes
echo 6. Save the current directory path to a file
echo 7. Rename a file
echo 8. Replace a file with another file
echo 9. Delete a file
echo 10. Create a directory
echo 11. Remove a directory
echo 12. Display file size

set /p input=Enter a number here:

if %input%==1 dir & goto :end
if %input%==2 tree & goto :end

if %input%==3 (
    set /p file=Enter the file name:
    set /p directory=Enter the directory name:
    move %file% %directory%
    goto :end
)

if %input%==4 (
    set /p file=Enter the file name:
    dir /T /Q %file%
    goto :end
)

if %input%==5 (
    set /p file=Enter the file name:
    dir %file% /a
    goto :end
)

if %input%==6 (
    set /p file=Enter the file name:
    cd >> %file%
    goto :end
)

if %input%==7 (
    set /p file=Enter the file name:
    set /p newname=Enter the new name:
    move %file% %newname%
    goto :end
)

if %input%==8 (
    set /p file=Enter the file name:
    set /p newfile=Enter the new file name:
    copy %file% %newfile%
    goto :end
)

if %input%==9 (
    set /p file=Enter the file name:
    del /Q %file%
    goto :end
)

if %input%==10 (
    set /p directory=Enter the directory name:
    mkdir %directory%
    goto :end
)

if %input%==11 (
    set /p directory=Enter the directory name:
    rmdir %directory%
    goto :end
)

if %input%==12 (
    set /p file=Enter the file name:
    dir %file% /s
    goto :end
)

:network

echo Choose the feature that you want to use

echo 1. View the current password and login restrictions on the computer
echo 2. Display the curent server on workgroup settings
echo 3. Add or remove a computer attached to a domain controller
echo 4. View details of a particular user
echo 5. Stop a particular service
echo 6. Start a particular service
echo 7. Display network statistics of the workstation or server
echo 8. Connect to a shared resource or display information about connections
echo 9. Disconnect from a shared resource

set /p input=Enter a number here:

if %input%==1 net accounts & goto :end
if %input%==2 net config workstation & goto :end
if %input%==3 net computer & goto :end
rem to fix 3
if %input%==4 (
    set /p user=Enter the user name:
    net user %user%
    goto :end
)

if %input%==5 (
    set /p service=Enter the service name:
    net stop %service%
    goto :end
)

if %input%==6 (
    set /p service=Enter the service name:
    net start %service%
    goto :end
)

if %input%==7 net statistics workstation & goto :end

if %input%==8 (
    set /p server=Enter the server name:
    net view %server%
    goto :end
)

if %input%==9 (
    set /p server=Enter the server name:
    net use %server% /delete
    goto :end
)

:process

echo Choose the feature that you want to use

echo 1. Display the running processes
echo 2. Display the process information
echo 3. Kill a process
echo 4. Start a new process

set /p input=Enter a number here:

if %input%==1 tasklist & goto :end

if %input%==2 (
    set /p process=Enter the process name:
    tasklist | findstr /C:"%process%"
    goto :end
)

if %input%==3 (
    set /p process=Enter the process name:
    taskkill /im %process%
    goto :end
)

if %input%==4 (
    set /p process=Enter the process name:
    start %process%
    goto :end
)

:data

echo Choose the feature that you want to use

echo 1. Search for a string in a file
echo 2. Sort the contents of a file
echo 3. Search for a specific string in a text file
echo 4. Compare two files and display the differences.
echo 5. Display the contents of a text file.
echo 6. Display message "Hello World"

set /p input=Enter a number here:

if %input%==1 (
    set /p file=Enter the file name:
    set /p word=Enter the word:
    findstr /I "%word%" %file%
    goto :end
)

if %input%==2 (
    set /p file=Enter the file name:
    sort %file%
    goto :end
)

if %input%==3 (
    set /p file=Enter the file name:
    set /p word=Enter the word:
    findstr /C:"%word%" %file%
    goto :end
)

if %input%==4 (
    set /p file1=Enter the first file name:
    set /p file2=Enter the second file name:
    fc %file1% %file2%
    goto :end
)

if %input%==5 (
    set /p file=Enter the file name:
    type %file%
    goto :end
)

if %input%==6 echo Hello World & goto :end

:end
