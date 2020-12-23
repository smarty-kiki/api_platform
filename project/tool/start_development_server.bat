@echo off
set LAST_DIR=%cd%
cd /d %~dp0

set ROOT_DIR=%cd%\..\..

call dep_build.bat

docker run --rm -ti -p 80:80 -p 8080:8080 -p 3306:3306 --name api_platform ^
    -v %ROOT_DIR%/:/var/www/api_platform ^
    -v %ROOT_DIR%/project/config/development/nginx/api_platform.conf:/etc/nginx/sites-enabled/default ^
    -v %ROOT_DIR%/project/config/development/supervisor/api_platform_queue_worker.conf:/etc/supervisor/conf.d/api_platform_queue_worker.conf ^
    -e PRJ_HOME=/var/www/api_platform ^
    -e ENV=development ^
    -e TIMEZONE=Asia/Shanghai ^
    -e AFTER_START_SHELL=/var/www/api_platform/project/tool/development/after_env_start.sh ^
kikiyao/debian_php_dev_env start

cd %LAST_DIR%