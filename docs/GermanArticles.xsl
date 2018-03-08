<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <xsl:for-each select="dataroot/SortedNewspaperLinks">
            <xsl:sort select="LastName"/>
            <xsl:sort select="FirstName"/>
            <xsl:sort select="MaidenName"/>
            <xsl:if test="Translation">
                <h3>
                    <xsl:if test="MaidenName">
                        <xsl:value-of select="concat(LastName, ', ', FirstName, ' ', MaidenName)"/>
                    </xsl:if>
                    <xsl:if test="not(MaidenName)">
                        <xsl:value-of select="concat(LastName, ', ', FirstName)"/>
                    </xsl:if>
                </h3>
            
                <ul>
                    <xsl:variable name="varNewspaperName" select="substring(concat('N/A', NewspaperName), (3+1) * number(boolean(NewspaperName)))"/>
                    <xsl:variable name="varNewspaperPage" select="substring(concat('N/A', Page), (3+1) * number(boolean(Page)))"/>
                    <xsl:variable name="varNewspaperColumn" select="substring(concat('N/A', Column), (3+1) * number(boolean(Column)))"/>
                    <xsl:variable name="varNewspaperDate" select="substring(concat('N/A', NewspaperDate), (3+1) * number(boolean(NewspaperDate)))"/>
                    <xsl:variable name="varNewspaperDay" select="substring(concat('N/A', NewspaperDay), (3+1) * number(boolean(NewspaperDay)))"/>
                    <li><xsl:value-of select="concat($varNewspaperName, ', ', $varNewspaperDay, ', ', $varNewspaperDate, ', pg: ', $varNewspaperPage, ', column: ', $varNewspaperColumn)"/></li>
                </ul>

                <div class="fraktur" style="background-color:#eee;border:1px solid #999;display:block;padding:20px;">
                    <xsl:value-of disable-output-escaping="yes" select="Transcription"/>
                </div>
                <div style="background-color:#eee;border:1px solid #999;display:block;padding:20px;">
                    <xsl:value-of disable-output-escaping="yes" select="Transcription"/>
                </div>
                <div style="background-color:#eee;border:1px solid #999;display:block;padding:20px;">
                    <xsl:value-of disable-output-escaping="yes" select="Translation"/>
                </div>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>