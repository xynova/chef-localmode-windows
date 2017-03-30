
@echo off
pushd %~dp0
bash knife-init.sh %userprofile% %~dp0
popd