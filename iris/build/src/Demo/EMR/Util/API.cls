Class Demo.EMR.Util.API Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>

<Route Url="/patient" Method="POST" Call="CreatePatient" Cors="true"/>
<Route Url="/patient/:id" Method="GET" Call="ReadPatient" Cors="true"/>
<Route Url="/patient/:id" Method="POST" Call="UpdatePatient" Cors="true"/>

</Routes>
}

ClassMethod CreatePatient()
{
	#dim %request As %CSP.Request
	#dim %response As %CSP.Response

	set json = %request.Content.Read()
	
	//s ^DBG($I(^DBG,$ZDT($H))) = json
	set patient = ##class(Demo.EMR.Data.Patient).%New()
	
	set status = patient.%JSONImport(json)
	
	if $$$ISOK(status) {
		set status = patient.%Save()
	}
	
	if $$$ISOK(status) {
		set %response.ContentType = ..#CONTENTTYPEJSON
		
		set %response.Status = ..#HTTP201CREATED
	} else {
		set %response.Status = ..#HTTP500INTERNALSERVERERROR
	}
	
	do patient.%JSONExport()
	
	return $$$OK
}

ClassMethod ReadPatient(patientId As %String)
{
	#dim %request As %CSP.Request
	#dim %response As %CSP.Response

	set patientFound = 0

	if patientId'="" {

	
		#dim patient As Demo.EMR.Data.Patient
		
		set patient = ##class(Demo.EMR.Data.Patient).%OpenId(patientId,,.status)

		if $$$ISOK(status)&&$ISOBJECT(patient) {
			set patientFound = 1
			
		}
	}
	
	if patientFound {
		set %response.ContentType = ..#CONTENTTYPEJSON
		do patient.%JSONExport()
		set %response.Status = ..#HTTP200OK
	} else {
		set %response.Status = ..#HTTP404NOTFOUND
	}
	
	
	
	return $$$OK
}

ClassMethod UpdatePatient(patientId As %String)
{
	#dim %request As %CSP.Request
	#dim %response As %CSP.Response

	set patientFound = 0

	if patientId'="" {

	
		#dim patient As Demo.EMR.Data.Patient
		
		set patient = ##class(Demo.EMR.Data.Patient).%OpenId(patientId,,.status)

		if $$$ISOK(status)&&$ISOBJECT(patient) {
			set patientFound = 1
			set json = %request.Content.Read()
			set status = patient.%JSONImport(json)
	
			if $$$ISOK(status) {
				set status = patient.%Save()
			}
		}
	}
	
	if patientFound&&$$$ISOK(status) {
		set %response.ContentType = ..#CONTENTTYPEJSON
		do patient.%JSONExport()
		set %response.Status = ..#HTTP201CREATED
	} else {
		set %response.Status = ..#HTTP404NOTFOUND
	}
	
	
	
	return $$$OK
}

/// Specifies the default character set for the page.  This can be overriden using the
/// &lt;CSP:CONTENT CHARSET=&gt; tag, or by setting the <b>%response</b>.CharSet property
/// in the <method>OnPreHTTP</method> method.  If this parameter is not specified, then
/// for the default charset is utf-8.
Parameter CHARSET = "utf-8";

/// Specifies if input %request.Content or %request.MimeData values are converted from their
/// original character set on input. By default (0) we do not modify these and receive them
/// as a binary stream which may need to be converted manually later. If 1 then if there
/// is a 'charset' value in the request Content-Type or mime section we will convert from this
/// charset when the input data is text based. For either json or xml data with no charset
/// this will convert from utf-8 or honor the BOM if one is present.
Parameter CONVERTINPUTSTREAM = 1;

}
