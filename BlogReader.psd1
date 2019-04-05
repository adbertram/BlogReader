@{
	RootModule        = 'BlogReader.psm1'
	ModuleVersion     = '0.1'
	GUID              = 'b375c986-205d-4759-a4cb-3180dc073a64'
	Author            = 'Adam Bertram'
	CompanyName       = 'Adam the Automator, LLC'
	Copyright         = '(c) 2019 Adam the Automator, LLC. All rights reserved.'
	Description       = 'A PowerShell module to download blog articles and read them naturally using Azure Cognitive Services.'
	FunctionsToExport = '*'
	RequiredModules   = 'Az.CognitiveServices'
	CmdletsToExport   = '*'
	VariablesToExport = '*'
	AliasesToExport   = '*'
	PrivateData       = @{
		PSData = @{
			Tags       = @('AzureCognitiveServices', 'Blogs')
			ProjectUri = 'https://github.com/adbertram/BlogReader'
		}
	}
}