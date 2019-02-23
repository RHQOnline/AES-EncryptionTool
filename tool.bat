@echo off
title RHQOnline AES Encryptor / Decryptor
color 0c
cls

:intro
cls
echo Please verify that the file you wish to encrypt / decrypt
echo is in the same directory as this tool's installation.
echo.
pause
goto askFileName

:askFileName
cls
echo Please input the name of the file you wish to
echo encrypt or decrypt.
echo.
set /p targetFile="Target File Name: "
goto askOutputFile

:askOutputFile
cls
echo Please input the name of the file you wish
echo the encrypted / decrypted file to be named.
echo.
set /p outputFile="Output File Name: "
goto askEncryptDecrypt

:askEncryptDecrypt
cls
echo Do you wish to...
echo  1) encrypt
echo  2) decrypt
echo.
set /p edSelect="(1/2): "
if %edSelect% == 1 goto encryptPrompt
if %edSelect% == 2 goto decryptPrompt
goto invalidInput

:invalidInput
cls
echo Invalid input.
goto askEncryptDecrypt

:encryptPrompt
cls
echo Please enter the encryption key you wish to use.
echo PLEASE MAKE NOTE OF THIS, YOU WILL NEED IT TO DECRYPT.
echo.
set /p encryptionKey="Encryption Key: "
goto encrypt

:encrypt
aes -e %encryptionKey% %targetFile% %outputFile%
goto encrypted

:encrypted
echo.
echo File(s) successfully encrypted!
pause
goto askFileName

:decryptPrompt
cls
echo Please enter the decryption key for the file.
echo This is the encryption key used to encrypt the file.
echo.
set /p decryptionKey="Decryption Key: "
goto decrypt

:decrypt
aes -d %encryptionKey% %targetFile% %outputFile%
goto decrypted

:decrypted
echo.
echo File(s) successfully decrypted!
pause
goto askFileName