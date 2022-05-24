# https://medium.com/maestral-solutions/code-inspection-with-resharpers-command-line-tools-20dd88b143d1
# .\Transform-Xslt.ps1 -xsl ic.xslt -xml input-file-path\file.xml -output output-file-path\page.html

param ($xml, $xsl, $output)

if (-not $xml -or -not $xsl -or -not $output)
{
	Write-Host "& .\Transform-Xslt.ps1 [-xml] xml-input [-xsl] xsl-input [-output] transform-output"
	exit;
}

trap [Exception]
{
	Write-Host $_.Exception;
}

$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.Load($xsl);
$xslt.Transform($xml, $output);