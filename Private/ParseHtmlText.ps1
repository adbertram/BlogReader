function ParseHtmlText {
	[OutputType('string')]
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$Html	
	)

	$ErrorActionPreference = 'Stop'

	# Create HTML file Object
	$oHtmlFile = New-Object -Com "HTMLFile"

	# Write HTML content according to DOM Level2 
	$oHtmlFile.IHTMLDocument2_write($Html)

	$oHtmlFile.body.innerText
}