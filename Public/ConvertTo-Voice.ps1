function ConvertTo-Voice {
	[OutputType('void')]
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$Text,
		
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[ValidateSet('raw-16khz-16bit-mono-pcm', 'raw-8khz-8bit-mono-mulaw',
			'riff-8khz-8bit-mono-alaw', 'riff-8khz-8bit-mono-mulaw',
			'riff-16khz-16bit-mono-pcm', 'audio-16khz-128kbitrate-mono-mp3',
			'audio-16khz-64kbitrate-mono-mp3', 'audio-16khz-32kbitrate-mono-mp3',
			'raw-24khz-16bit-mono-pcm', 'riff-24khz-16bit-mono-pcm',
			'audio-24khz-160kbitrate-mono-mp3', 'audio-24khz-96kbitrate-mono-mp3',
			'audio-24khz-48kbitrate-mono-mp3')]
		[string]$AudioOutput,

		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[ValidateSet('ZiraRUS', 'JessaRUS', 'BenjaminRUS', 'Jessa24kRUS', 'Guy24kRUS')]
		[string]$VoiceAgent
	)

	$genderMap = @{
		'ZiraRUS'     = 'Female'
		'JessaRUS'    = 'Female'
		'Jessa24kRUS' = 'Female'
		'BenjaminRUS' = 'Male'
		'Guy24kRUS'   = 'Male'
	}

	$gender = $genderMap[$VoiceAgent]

	$ErrorActionPreference = 'Stop'

	$ssml = "<speak version='1.0' xml:lang='en-US'><voice xml:lang='en-US' xml:gender='$gender'
	name='Microsoft Server Speech Text to Speech Voice (en-US, $VoiceAgent)'>
	$Text
	</voice></speak>"

	$params = @{
		'Headers' = @{'X-Microsoft-OutputFormat' = $AudioOutput }
		'Body'    = $ssml
	}
	InvokeConvertCsTsApi @params
}

