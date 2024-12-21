Class Demo.Int.BO.EMRRESTOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method CreatePatient(
	pRequest As Demo.Int.Msg.Patient,
	Output pResponse As Ens.StringResponse) As %Status
{
	set status = pRequest.%JSONExportToString(.json)
	
	set pResponse = ##class(Ens.StringResponse).%New()
	set httpRequest = ##class(%Net.HttpRequest).%New()
	
	do httpRequest.SetHeader("CONTENT-TYPE","application/json; charset=utf-8")
	
	//set httpRequest.ContentType = "application/json"
	//set httpRequest.ContentCharset = "UTF-8"
	
	do httpRequest.EntityBody.Write(json)
	
	#dim httpResponse As %Net.HttpResponse
	set status = ..Adapter.SendFormData(.httpResponse,"POST",.httpRequest)
	
	if $$$ISOK(status) {
		
		
		set pResponse.StringValue = httpResponse.StatusCode
		
	}

	Quit status
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Demo.Int.Msg.Patient"> 
		<Method>CreatePatient</Method>
	</MapItem>
</MapItems>
}

}
