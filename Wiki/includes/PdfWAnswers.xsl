<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
 version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xmlns:x="http://www.imsglobal.org/xsd/imsqti_v2p1" 
 xsi:schemaLocation="http://www.imsglobal.org/xsd/imsqti_v2p1 http://www.imsglobal.org/xsd/imsqti_v2p1.xsd">
<xsl:output method="text" encoding="UTF-8" indent="no"/>

<xsl:template match="/x:assessmentItem">
    <xsl:text>Title: </xsl:text><xsl:value-of select="@title"/> 
    <xsl:text>&#10;</xsl:text>
    
    <xsl:variable name="Stimulus">
	<xsl:value-of select="//x:div/text()"/>
	</xsl:variable>
	
	<xsl:if test="normalize-space($Stimulus)!=''"> 
	<xsl:value-of select="//x:div/text()"/>
	<xsl:text>&#10;</xsl:text>
	</xsl:if>
	 
    <xsl:variable name="class">
    <xsl:value-of select="//@class"/>
    </xsl:variable>
  	
  <xsl:choose>
  <xsl:when test="$class!='eqiat-te'">
  
        <xsl:for-each select="//x:ol">
		    <xsl:text>Option List:</xsl:text>
			   <xsl:if test="@class='emioptions'"> 
				<xsl:for-each select="//x:li">
				 &#x09;<xsl:text>*</xsl:text>&#9;<xsl:value-of select="."/>
			   </xsl:for-each>
			  </xsl:if>
			  <xsl:text>&#10;</xsl:text>  
		  </xsl:for-each>
		  
  		<xsl:for-each select="//x:choiceInteraction">	
				<xsl:variable name="correctAnswerid">
			     <xsl:value-of select="./@responseIdentifier"/>
			  	</xsl:variable>	  
			  	<xsl:variable name="Question">
			    <xsl:value-of select="x:prompt"/>
			  	</xsl:variable>
			  <xsl:if test="normalize-space($Question)!=''"> 
				  <xsl:text>Question:</xsl:text>
				  <xsl:text>&#10;</xsl:text>			  	  
				  <xsl:value-of select="x:prompt"/>
				  <xsl:text>&#10;</xsl:text>
	          </xsl:if> 
			  				   
			<xsl:text>Choices:</xsl:text>	 
			<xsl:text>&#10;</xsl:text> 	   
			   <xsl:for-each select="x:simpleChoice">
			  	&#x09;<xsl:text>*</xsl:text>&#9;<xsl:value-of select="."/>
			  	<xsl:text>&#10;</xsl:text>	
			  </xsl:for-each>
			 
			  
			    <xsl:for-each select="//x:responseDeclaration[@identifier=normalize-space(string($correctAnswerid))]">
			  		
			    <xsl:variable name="correctAnswer"> <xsl:value-of select="x:correctResponse"/> </xsl:variable>
		   	            
		   <xsl:text>Correct Answer(s):</xsl:text> 
		    <xsl:text>&#10;</xsl:text>	
			            <xsl:for-each select="//x:choiceInteraction[@responseIdentifier=normalize-space(string($correctAnswerid))]">
				             <xsl:for-each select="x:simpleChoice">
				            	    <xsl:variable name="id"> <xsl:value-of select="@identifier"/> </xsl:variable>
							        <xsl:if test="contains(normalize-space(string($correctAnswer)),$id)"> 
							        <xsl:text>*</xsl:text>&#9;<xsl:value-of select="//x:simpleChoice[normalize-space(string(@identifier))=$id]"/>
								  	<xsl:text>&#10;</xsl:text>
								  	</xsl:if>
					  	     </xsl:for-each>
					   </xsl:for-each>	
			    </xsl:for-each>
		    </xsl:for-each>
  </xsl:when>
  <xsl:otherwise>
  
  <xsl:variable name="Question">
  <xsl:value-of select="//x:div[@class='textentrytextbody']"/>
  </xsl:variable>
  
 <xsl:if test="normalize-space($Question)!=''"> 
 <xsl:text>Question: </xsl:text>
 <xsl:text>&#10;</xsl:text>	  	  
 <xsl:value-of select="normalize-space(string(//x:div[@class='textentrytextbody']))"/>
 <xsl:text>&#10;</xsl:text>
 </xsl:if> 
	<xsl:for-each select="//x:textEntryInteraction">
	
	<xsl:variable name="GabId"> 
	<xsl:value-of select="@responseIdentifier"/>
	</xsl:variable>
	  	 <xsl:for-each select="//x:responseDeclaration[@identifier=normalize-space(string($GabId))]">
	  	   <xsl:for-each select="x:mapping">
<xsl:text>Correct Answer(s) for gap </xsl:text><xsl:value-of select="number(substring($GabId,14,2))+1"/>:
<xsl:for-each select="x:mapEntry"><xsl:value-of select="normalize-space(@mapKey)"/><xsl:text>&#10;</xsl:text></xsl:for-each> 			 	
</xsl:for-each>
		    <xsl:text>&#10;</xsl:text>	
	   </xsl:for-each>	 
  </xsl:for-each>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>