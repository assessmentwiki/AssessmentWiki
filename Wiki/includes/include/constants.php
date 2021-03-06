<?php 

/*
 * Eqiat
 * Easy QTI Item Authoring Tool
 */

/*------------------------------------------------------------------------------
(c) 2010 JISC-funded EASiHE project, University of Southampton
Licensed under the Creative Commons 'Attribution non-commercial share alike' 
licence -- see the LICENCE file for more details
------------------------------------------------------------------------------*/

// program
define("PROGRAMNAME", "Eqiat");
define("VERSION", "0.7~git");

// URL of demo server with trailing slash (this is used in the stylesheet URL of 
// the produced items)
//define("DEMO_URL", "http://gauss.ecs.soton.ac.uk/eqiat/");

// filesystem path to the eqiat root directory -- one level above this file, 
// ending in a trailing slash
//define("SITEROOT_LOCAL", str_replace("\\","/",dirname(dirname(__FILE__))) . "/");
define("SITEROOT_LOCAL", "/Wiki/includes/");

// add the trailing slash to document_root if it doesn't already have it
$document_root = $_SERVER["DOCUMENT_ROOT"];
if ($document_root[strlen($document_root) - 1] != "/")
	$document_root .= "/";

// query path to the eqiat root directory ending in a trailing slash -- makes an 
// absolute URL to the main page
define("SITEROOT_WEB", "/" . substr(SITEROOT_LOCAL, strlen($document_root)));
// TODO: Ensure the above two give the expected results on different server 
// types. Expected values:
// SITEROOT_LOCAL (should this have backslashes if Windows?)
// 	/var/www/eqiat/ (or /var/www/ if not running in a subdirectory)
// SITEROOT_WEB
// 	/eqiat/ (or / if not running in a subdirectory)

// namespaces
define("NS_IMSQTI", "http://www.imsglobal.org/xsd/imsqti_v2p1");
define("NS_IMSMD", "http://www.imsglobal.org/xsd/imsmd_v1p2");

// configuration----------------------------------------------------------------

// host of QTIEngine
//define("QTIENGINE_HOST", "qtiengine.qtitools.org");
//define("QTIENGINE_HOST", "localhost");
// site title
define("SITE_TITLE", PROGRAMNAME);

// session variable name prefix
define("SESSION_PREFIX", PROGRAMNAME . "_");

// set up include path
//ini_set("include_path", ".;" . $wgScriptPath . "/includes/include");

// use the "deposit in Edshare" action
//define("DIEA_AVAILABLE", false);

// host of Edshare (set and uncomment)
//define("DIEA_EDSHARE_HOST", "edshare.soton.ac.uk");


?>
