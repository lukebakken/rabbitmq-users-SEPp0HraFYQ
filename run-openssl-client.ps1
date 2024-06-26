param([string]$TlsHost='localhost', [int]$TlsPort=5671)

$ProgressPreference = 'Continue'
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

Write-Host "[INFO] Connecting to TLS host: $TlsHost, TLS port: $TlsPort"

$certs_dir = Join-Path -Path $PSScriptRoot -ChildPath 'certs'
$ca_file   = Join-Path -Path $certs_dir -ChildPath 'cacert.pem'
$cert_file = Join-Path -Path $certs_dir -ChildPath 'ECC384cert.pem'
$key_file  = Join-Path -Path $certs_dir -ChildPath 'ECC384key.pem'

& openssl s_client -tls1_3 -connect "${TlsHost}:${TlsPort}" -CAfile $ca_file -cert $cert_file -key $key_file -verify 8
