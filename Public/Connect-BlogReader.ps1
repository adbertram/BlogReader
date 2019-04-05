function Connect-BlogReader {
	[OutputType('pscustomobject')]
	[CmdletBinding()]
	param
	()

	$ErrorActionPreference = 'Stop'

	$script:config = GetConfiguration

	$params = @{
		ResourceGroupName = $script:config.CognitiveServicesAccount.ResourceGroupName
		Name              = $script:config.CognitiveServicesAccount.Name
	}

	$keys = Get-AzCognitiveServicesAccountKey @params
	$script:config | Add-Member -NotePropertyName 'Key' -NotePropertyValue $keys.Key1
	RefreshCsToken
}