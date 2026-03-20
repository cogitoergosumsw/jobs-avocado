#Requires -Version 7.0
<#
.SYNOPSIS
    Runs sqlc to generate Go code from SQL queries.
.DESCRIPTION
    Executes sqlc generate in apps/api to produce type-safe Go functions
    from the SQL queries in apps/api/db/queries/.
#>

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
Push-Location $ProjectRoot

try {
    # TODO: Run sqlc to generate Go code from SQL queries
    # Example: Push-Location apps/api; sqlc generate; Pop-Location
    Write-Host "sqlc-generate: not yet implemented" -ForegroundColor Yellow
}
finally {
    Pop-Location
}
