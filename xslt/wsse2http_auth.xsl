<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dp="http://www.datapower.com/extensions"
                xmlns:dpquery="http://www.datapower.com/param/query"
                extension-element-prefixes="dp"
                exclude-result-prefixes="dp"
                version="1.0">

  <!--<xsl:param name="dpquery:username"/>
  <xsl:param name="dpquery:password"/> -->
  
<xsl:variable name="Username" select="/*[local-name()='Envelope']/*[local-name()='Header']/*[local-name()='Security']/*[local-name()='UsernameToken']/*[local-name()='Username']"/>
<xsl:variable name="Password" select="/*[local-name()='Envelope']/*[local-name()='Header']/*[local-name()='Security']/*[local-name()='UsernameToken']/*[local-name()='Password']"/>
  
 <xsl:message><xsl:value-of select="$Username"/> : <xsl:value-of select="$Password"/> </xsl:message> 

  <xsl:template match="/">
    <dp:set-http-request-header name="'Authorization'" value="concat('Basic ', dp:encode(concat($Username,':',$Password),'base-64'))"/>
    <xsl:copy-of select="."/>
  </xsl:template>

</xsl:stylesheet>
