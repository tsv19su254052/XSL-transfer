<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/FlightsByRoutes">
        <FLTS>
            <xsl:apply-templates select="Flight"/>
        </FLTS>
    </xsl:template>

    <xsl:template match="Flight">
        <FL FlightNumberString="{@FlightNumberString}">
            <xsl:value-of select="step"/>
        </FL>
    </xsl:template>

</xsl:stylesheet>
