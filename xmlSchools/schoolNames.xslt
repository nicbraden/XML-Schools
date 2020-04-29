<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

    <xsl:output method="html" indent="yes" />

    <xsl:param name="schoolTitle">
       
    </xsl:param>
    <xsl:param name="schoolType" select="'London-Schools'" />

    <xsl:template match="/">
        <table style="width:95%" border="1">
            <tr style="background-color:#4CAF50">
                <th>
                    <font face="Verdana" size="4" color="#ffffff">School Name</font>
                </th>
                <th>
                    <font face="Verdana" size="4" color="#ffffff">Board</font>
                </th>
                <th>
                    <font face="Verdana" size="4" color="#ffffff">Address</font>
                </th>
            </tr>
                <xsl:apply-templates select="//School">
                    <xsl:sort select="./@short-name"/>
                </xsl:apply-templates>
                <xsl:choose>
                    <xsl:when test="$schoolType='All Schools'">
                    Match(es) found
                    <xsl:value-of select="count(//School[contains(Name, $schoolTitle)])"/>
                    </xsl:when>
                    <xsl:otherwise>
                        Match(es) found <xsl:value-of select="count(//School[contains(Name, $schoolTitle) and local-name(./..)=$schoolType])"/>
                    </xsl:otherwise>
                </xsl:choose>
        </table>
    </xsl:template>
 
    <xsl:template match="School">
        
        <xsl:if test="contains(Name, $schoolTitle) and local-name(./..)=$schoolType">
            <xsl:element name="tr">
            <xsl:element name="td">
                <a href="{Website}">
                    <xsl:value-of select="./Name" />
                </a>
            </xsl:element>
            <xsl:element name="td">
                <xsl:value-of select="Board" />
            </xsl:element>
            <xsl:element name="td">
                <xsl:value-of select="Address" />
            </xsl:element>
            </xsl:element>
        </xsl:if>    

        <xsl:if test="$schoolType='All Schools' and contains(Name, $schoolTitle)">
            <xsl:for-each select=".">
                <xsl:sort select="Name"/>
                <xsl:element name="tr">
                <xsl:element name="td">
                    <a href="{Website}">
                        <xsl:value-of select="Name" />
                    </a>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:value-of select="Board" />
                </xsl:element>
                <xsl:element name="td">
                    <xsl:value-of select="Address" />
                </xsl:element>
                </xsl:element>
            </xsl:for-each>
            </xsl:if>
    
    </xsl:template>   

</xsl:stylesheet>