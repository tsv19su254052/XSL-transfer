<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0"
                xmlns:Date="java:java.util.Date">
    <xsl:script implements-prefix="Date" language="java" src="java:java.util.Date"/> <!-- fixme выдает ошибку -->
    <xsl:variable name="date" select="Date:to-string(Date:new())"/>
</xsl:stylesheet>
