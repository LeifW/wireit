<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:p="http://www.w3.org/ns/xproc"
      exclude-result-prefixes="xs p"
      version="1.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

<xsl:template match="/">
var demoLanguage = {
languageName: "meltingpotDemo",
propertiesFields: [
	{"type": "string", inputParams: {"name": "name", label: "Title", typeInvite: "Enter a title" } },
	{"type": "text", inputParams: {"name": "description", label: "Description", cols: 30} }
],
modules: [
<xsl:apply-templates/>
]
};
</xsl:template>
    
<xsl:template match="p:declare-step">
    {
        "name": "<xsl:value-of select="substring(@type,3)"/>",
        "container": {
            "xtype": "WireIt.FormContainer",
            "title": "<xsl:value-of select="@type"/>"
            <xsl:if test="p:input">, "inputTerminals": [
                <xsl:apply-templates select="p:input"/>
                ]</xsl:if>
    <xsl:if test="p:output">, "outputTerminals": [
        <xsl:apply-templates select=" p:output"/>
        ]</xsl:if>
    <xsl:if test="p:option">, "fields": [
        <xsl:apply-templates select=" p:option"/>
        ]</xsl:if>
                }
    }<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>
    
    <xsl:template match="p:input">
        {"name": "<xsl:value-of select="@port"/>"}<xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>
 
    <xsl:template match="p:output">
        {"name": "<xsl:value-of select="@port"/>"}<xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>
    
    <xsl:template match="p:option">
	    {"inputParams": {"label": "<xsl:value-of select="@name"/>"<xsl:apply-templates select="@*"/> } }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>
     
    
    <xsl:template match="@*">, "<xsl:value-of select="name()"/>": "<xsl:value-of select="."/>"</xsl:template>
	    
    <xsl:template match="@select">, "value": "<xsl:value-of select="substring(., 2, string-length()-2)"/>"</xsl:template>

</xsl:stylesheet>