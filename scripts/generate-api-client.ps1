#Requires -Version 7.0
<#
.SYNOPSIS
    Generates TypeScript API client from the OpenAPI spec.
.DESCRIPTION
    Runs openapi-typescript to generate typed client code from openapi/jobtopbob.yaml
    into packages/api-client/src/generated.ts.
#>

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
Push-Location $ProjectRoot

try {
    # TODO: Generate TypeScript API client from OpenAPI spec
    # Example: npx openapi-typescript openapi/jobtopbob.yaml -o packages/api-client/src/generated.ts
    Write-Host "generate-api-client: not yet implemented" -ForegroundColor Yellow
}
finally {
    Pop-Location
}
