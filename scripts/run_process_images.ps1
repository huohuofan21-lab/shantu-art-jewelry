# PowerShell 自动化：安装 Pillow、运行处理脚本并打包输出
# 使用方法（在项目根目录 PowerShell 中运行）：
#   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#   .\scripts\run_process_images.ps1

$ErrorActionPreference = 'Stop'
$proj = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
Write-Host "项目目录： $proj"
Set-Location -Path $proj

function Try-Run($cmd){
    try{
        Write-Host "Running: $cmd"
        iex $cmd
        return $true
    }catch{
        Write-Host "Failed: $cmd`n $_"
        return $false
    }
}

# 安装 Pillow
$installed = $false
if (Try-Run 'py -3 -m pip install --user Pillow') { $installed = $true }
elseif (Try-Run 'python -m pip install --user Pillow') { $installed = $true }
else {
    $pyPath = 'C:\\Users\\' + $env:USERNAME + '\\AppData\\Local\\Microsoft\\WindowsApps\\python.exe'
    if (Test-Path $pyPath) {
        if (Try-Run "& '$pyPath' -m pip install --user Pillow") { $installed = $true }
    }
}

if (-not $installed) {
    Write-Host "无法自动安装 Pillow，请手动安装 Python 并确保 'py' 或 'python' 可用，或联系技术人员。"
    exit 1
}

# 运行 Python 处理脚本
$ran = $false
if (Try-Run 'py -3 scripts\process_images.py') { $ran = $true }
elseif (Try-Run 'python scripts\process_images.py') { $ran = $true }
else {
    $pyPath = 'C:\\Users\\' + $env:USERNAME + '\\AppData\\Local\\Microsoft\\WindowsApps\\python.exe'
    if (Test-Path $pyPath) {
        if (Try-Run "& '$pyPath' scripts\process_images.py") { $ran = $true }
    }
}

if (-not $ran) {
    Write-Host "运行处理脚本失败。请确认 Python 可用或在终端手动运行 'python scripts/process_images.py'。"
    exit 1
}

# 打包输出
$converted = Join-Path $proj 'assets\images\converted'
if (Test-Path $converted) {
    $zip = Join-Path $proj 'assets\images\converted.zip'
    if (Test-Path $zip) { Remove-Item $zip }
    Compress-Archive -Path (Join-Path $converted '*') -DestinationPath $zip
    Write-Host "已生成： $zip"
    Write-Host "请把 $zip 上传到对话，我将为你替换页面图片并生成预览。"
}else{
    Write-Host "未找到输出目录： $converted 。请检查脚本输出或手动运行脚本。"
}
