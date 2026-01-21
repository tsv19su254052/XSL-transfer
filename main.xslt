<?xml version="1.0" encoding="UTF-8"?>
<!-- 	todo Конфигурация с URI -->

<!-- 	Префиксы пространства имен (краткие псевдонимы вместо их URI):
	согласно спецификации XSLT,
	определяемые производителями,
	пользовательские,
	отделенные пустыми строками
				xmlns:xslt1="http://www.w3.org/TR/xslt"
				xmlns:xslt3="http://www.w3.org/TR/xslt20"
				xmlns:xslt3="https://www.w3.org/standards/xml/transformation"
				-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:nvdl="http://purl.oclc.org/dsdl/nvdl/ns/structure/1.0"
                xmlns:ns="https://www.w3schools.com"
                xmlns:xml="http://www.w3.org/XML/1998/namespace"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xi="http://www.w3.org/2001/xinclude"
                xmlns:fn="http://www.w3.org/2004/07/xpath-functions"
                xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes"
                xmlns:css="http://www.w3.org/1996/css"
                xmlns:collation="http://www.w3.org/2013/collation/UCA?strength=secondary"
                xmlns:xsv="http://www.w3.org/2007/XMLSchema-versioning"
                xmlns:xproc="http://www.w3.org/ns/xproc"
                xmlns:xproc-step="http://www.w3.org/ns/xproc-step"
                xmlns:xproc-err="http://www.w3.org/ns/xproc-error"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"

                xmlns:schematron="http://purl.oclc.org/dsdl/schematron"
                xmlns:sqltypes="https://schemas.microsoft.com/sqlserver/2004/sqltypes"
                xmlns:soap="https://schemas.microsoft.com/sqlserver/2004/SOAP"
                xmlns:ms="urn:schemas-microsoft-com:mapping-schema"
                xmlns:dt="urn:schemas-microsoft-com:datatypes"
                xmlns:sql="urn:schemas-microsoft-com:xml-sql"
                xmlns:set="http://transpect.io/xml2tex"
                xmlns:saxon="http://saxon.sf.net"
                xmlns:soapex="http://schemas.xmlsoap.org/soap/envelope"
                xmlns:pxf="http://exproc.org/proposed/steps/file"
                xmlns:tr="http://transpect.io"
                xmlns:rng="http://relaxng.org/ns/structure/1.0"
				xmlns:math="http://math.org"
                xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"

                xmlns:user="http://acme.com"

				version="3.0">

	<!-- t (вместе со свойством схемы "targetNamespace"), xsd, xsi, ns - префиксы пространства имен (краткие псевдонимы вместо их URI) -->
	<xsd:annotation>
		<xsd:documentation>
			Описание - Правила XSLT-преобразования
            ==== Импорт внешних файлов ====
			<xsl:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl" />
			<xsl:import href="http://transpect.io/calabash-extensions/epubcheck-extension/epubcheck-declaration.xpl" />
			<xsl:import href="http://transpect.io/xproc-util/file-uri/xpl/file-uri.xpl" />
			<xsl:import href="http://transpect.io/xproc-util/store-debug/xpl/store-debug.xpl" />
			<xsl:import href="http://transpect.io/xproc-util/simple-progress-msg/xpl/simple-progress-msg.xpl" />
			==== Импорт внешнего документа ====
			<xsd:document href="http://this.transpect.io/xmlcatalog/catalog.xml" />
		</xsd:documentation>
	</xsd:annotation>

	<!--  the following imports are not needed. They simply provide readability
	<xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord"/>
	<xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"/>  -->

	<!--
	<xsl:include href="current_date_by_Java.xslt"/> fixme выдает ошибку (см. ошибку во включаемом файле) -->
	<xsl:import href="copyright.xslt"/>
	<xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord"/>
	<xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"/>

	<!-- Основная часть (несколько элементов) -->
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
<!-- Примечания: -->
