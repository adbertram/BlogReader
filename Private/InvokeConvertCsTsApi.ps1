function InvokeConvertCsTsApi {
	[OutputType('pscustomobject')]
	[CmdletBinding()]
	param
	(
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[string]$Endpoint = 'v1'
	)

	$ErrorActionPreference = 'Stop'

	$uri = 

	$params = @{
		Method = 'POST'
		Uri    = $uri
	}
	InvokeCsTsApi @params

	if (-not (Get-Variable -Name 'config' -Scope 'Script' -ErrorAction 'Ignore')) {
		throw 'Could not find session configuration. Have you ran Connect-BlogReader yet?'
	}
	
	$headers = @{
		'Authorization' = "Bearer $($script:config.Token)"
	}

	$params = @{
		Headers     = $Headers
		ContentType = 'application/ssml+xml'
		Method      = 'GET'
		Uri         = "https://$($script:config.SubscriptionRegion).tts.speech.microsoft.com/cognitiveservices/$Endpoint"
	}
	Invoke-RestMethod @params
}