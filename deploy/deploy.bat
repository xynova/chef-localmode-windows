
@echo off
pushd %~dp0
bash deploy.sh %*
popd
