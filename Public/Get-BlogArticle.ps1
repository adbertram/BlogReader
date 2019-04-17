function Get-BlogArticle {
	[OutputType('pscustomobject')]
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$RssFeedUrl
	)

	$ErrorActionPreference = 'Stop'

	try {
		$progBefore = $ProgressPreference
		$ProgressPreference = 'SilentlyContinue'
		$content = [xml](Invoke-WebRequest -Uri $RssFeedUrl).Content
		foreach ($item in $content.rss.channel.item) {
			$postText = $item.encoded.'#cdata-section'
			$output = @{
				'Title'           = $item.title
				'Link'            = $item.link
				'PublicationDate' = $item.pubDate
				'Text'            = $postText
			}
			[pscustomobject]$output
		}
	} catch {
		$PSCmdlet.ThrowTerminatingError($_)
	} finally {
		$ProgressPreference = $progBefore
	}
}