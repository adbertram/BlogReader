@{
	RootModule        = 'BlogReader.psm1'
	ModuleVersion     = '*'
	GUID              = '7a2c0351-7d8b-4c71-b616-0cf8412b12e3'
	Author            = 'Adam Bertram'
	CompanyName       = 'Adam the Automator, LLC'
	Copyright         = '(c) 2019 Adam the Automator, LLC. All rights reserved.'
	Description       = 'A PowerShell module to download blog articles and read them naturally using Azure Cognitive Services.'
	RequiredModules   = 'AzTextToSpeech'
	FunctionsToExport = '*'
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