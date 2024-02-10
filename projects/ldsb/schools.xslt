<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

  <xsl:output method="html" indent="yes"/>

  <xsl:param name="selectedType" />
  <xsl:param name="inputCharacter" />
  
  <!--place in a variable the query to be reused for counting the type of school and additional filter in the input box-->
  <xsl:variable name="query" select="//*[starts-with(name(), $selectedType)]/School[Name[contains(text(),$inputCharacter)]]" />
  
  <xsl:template match="/">
      <style>
          p {
            font-style: italic;
            color: green;
            font-weight: bold;
          }
            #schoolsTable {
            font-family: 'Roboto', sans-serif;
            border-collapse: collapse;
            width: 100%;
          }

          #schoolsTable td, #schoolsTable th {
            border: 1px solid #ddd;
            padding: 8px;
          }

          #schoolsTable tr:nth-child(even){background-color: #f2f2f2;}

          #schoolsTable tr:hover {background-color: #ddd;}

          #schoolsTable th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #ed6d82;
            color: white;
          }

          a {
            color: #322d4a;
            font-weight: bolder;
          }
      </style>
    <p>
      <xsl:value-of select="count($query)" />
      match(es) found
    </p>
    <table id="schoolsTable" style="width:90%" border="3">
      <tr>
        <th>
          <font face="Verdana" size="4">School</font>
        </th>
        <th>
          <font face="Verdana" size="4">Board</font>
        </th>
        <th>
          <font face="Verdana" size="4">Address</font>
        </th>
      </tr>
      <xsl:apply-templates select="$query">
        <xsl:sort select="Name" />
    </xsl:apply-templates> 
    </table>
  </xsl:template>

  <xsl:template match="School">
    <xsl:element name="tr">
      <xsl:element name="td">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="Website" />
          </xsl:attribute>
          <xsl:value-of select="Name" />
        </xsl:element>
      </xsl:element>
      <xsl:element name="td">
        <xsl:value-of select="Board"/>
      </xsl:element>
      <xsl:element name="td">
        <xsl:value-of select="Address" />
      </xsl:element>
    </xsl:element>
  </xsl:template>



</xsl:stylesheet>