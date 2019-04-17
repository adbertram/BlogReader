function ConvertTo-AudioFile {
	[OutputType('pscustomobject')]
	[CmdletBinding(SupportsShouldProcess)]
	param
	(
		[Parameter(Mandatory, ValueFromPipeline)]
		[ValidateNotNullOrEmpty()]
		[pscustomobject]$BlogArticle,
		
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
			'Text'        = $postText
			'AudioOutput' = 'audio-16khz-128kbitrate-mono-mp3'
			'VoiceAgent'  = 'Guy24kRUS'
			'OutputFile'  = $FilePath
		}
		ConvertTo-Speech @convertParams
	} catch {
		$PSCmdlet.ThrowTerminatingError($_)
	} finally {
		$ProgressPreference = $progBefore
	}
}