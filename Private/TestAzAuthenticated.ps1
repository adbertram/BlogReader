function TestAzAuthenticated {
	[OutputType('bool')]
	[CmdletBinding()]
	param
	()

	$ErrorActionPreference = 'Stop'

	if (-not (Get-AzureRmContext)) {
		$false
	} else {
		$true
	}
}