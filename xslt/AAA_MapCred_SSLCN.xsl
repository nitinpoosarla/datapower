<?xml version="1.0"?>
<!-- -->
<!-- J. Rasmussen IBM Corp -->
<!-- Set the MQ Reply2Queue using the param enter on Transform Screen, or ReplyQueue from the Backside URL -->
<!-- -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:dp="http://www.datapower.com/extensions" 
	extension-element-prefixes="dp">
	
	
	<xsl:output method="xml"/>
	
	<xsl:template match="/">
		<xsl:variable name="dn">
			<xsl:value-of select="//*[local-name()='dn']"/>
		</xsl:variable>
		<xsl:variable name="cn">
			<xsl:value-of select="substring-after($dn,'CN=')"/>
			<!--
			<xsl:value-of select="'cn=spp.sit.srv.westpac.com.au,ou=users,o=westpac'"/>
			<xsl:value-of select="'spp.sit.srv.westpac.com.au'"/>
			-->
		</xsl:variable>
		
		<xsl:message><xsl:value-of select="concat('- - - - - - - Credential: ',$cn)"/></xsl:message>
			
		<entry>	
		<xsl:value-of select="$cn"/>
		</entry>
		
		<!--
		<dp:set-variable name="'var://context/WSM/identity/credentials'" value="$cn" ></dp:set-variable>
		-->
			
	</xsl:template>
</xsl:stylesheet>
