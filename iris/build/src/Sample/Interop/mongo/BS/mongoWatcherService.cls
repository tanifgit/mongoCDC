Class Sample.Interop.mongo.BS.mongoWatcherService Extends Ens.BusinessService
{

Property Adapter As Sample.Interop.mongo.Adapter.InboundAdapter;

Parameter ADAPTER = "Sample.Interop.mongo.Adapter.InboundAdapter";

/// Override this method to process incoming data. Do not call SendRequestSync/Async() from outside this method (e.g. in a SOAP Service or a CSP page).
Method OnProcessInput(
	pInput As %Stream.GlobalCharacter,
	Output pOutput As %RegisteredObject,
	ByRef pHint As %String) As %Status
{
    #dim changeObj As Sample.mongodb.Definition.insertChange
	set changeObj = ##class(Sample.mongodb.Definition.insertChange).%New()

    // Fix some invalid JSON being sent by mongo
    //  For example usage of ' instead of ""
    //  and unquoted values, for example:
    //      Timestamp(1663013979, 1), 'fullDocument': {'_id': ObjectId('631f945b122fcc88e7f42155')
    set json = pInput.Read()
    $$$TRACE("original change JSON: "_json)
    set json = $REPLACE(json,"'","""")
    set json = $REPLACE(json,"Timestamp(","""Timestamp(")
    set json = $REPLACE(json,"datetime.datetime(","""datetime.datetime(")
    set json = $REPLACE(json,"ObjectId(""","""ObjectId(")
    set json = $REPLACE(json,""")",")")
    set json = $REPLACE(json,")",")""")
    $$$TRACE("change JSON after fixing: "_json)
    

    set status = changeObj.%JSONImport(json)
    $$$TRACE("JSON import status: "_status)
    $$$QuitOnError(status)

    set status = ..SendRequestAsync("mongo Change Router",changeObj)

    $$$QuitOnError(status)

    return $$$OK
}

}
