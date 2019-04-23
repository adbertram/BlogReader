function ConvertTo-AudioFile {
	[OutputType('void')]
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory, ValueFromPipeline)]
		[ValidateNotNullOrEmpty()]
		[pscustomobject]$BlogArticle,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$CognitiveServicesCustomVoiceEndpointUri,
		
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[string]$FilePath
	)

	$ErrorActionPreference = 'Stop'

	$postText = ParseHtmlText -Html $BlogArticle.Text

	try {
		$progBefore = $ProgressPreference
		$ProgressPreference = 'SilentlyContinue'

		$convertParams = @{
			'AudioOutput' = 'audio-16khz-128kbitrate-mono-mp3'
			'OutputFile'  = $FilePath
			'Text'        = $postText
		}
		if ($PSBoundParameters.ContainsKey('CognitiveServicesCustomVoiceEndpointUri')) {
			$convertParams.CustomEndpointUri = $CognitiveServicesCustomVoiceEndpointUri
		} else {
			$convertParams.VoiceAgent = 'Guy24kRUS'
		}
		ConvertTo-Speech @convertParams
	} catch {
		$PSCmdlet.ThrowTerminatingError($_)
	} finally {
		$ProgressPreference = $progBefore
	}
}