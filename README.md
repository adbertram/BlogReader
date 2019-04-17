# BlogReader

[![Build status](https://ci.appveyor.com/api/projects/status/2cowwl34qsjw9m34?svg=true)](https://ci.appveyor.com/project/adbertram/blogreader)

A sample project that downloads blog articles and reads them using Azure Cognitive Services

## Requirements
1. An Azure Cognitive Services account
2. You're authenticated to Azure in PowerShell

## Setup Instructions
1. Modify the configuration.json file with your:
  - token endpoint
  - subscription region
  - cognitive service account and resource group name
2. Run Connect-AzTextToSpeech.
