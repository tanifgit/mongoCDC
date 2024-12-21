Class Sample.mongodb.Definition.fullDocument Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property "_id" As %VarString;

Property mrn As %String;

Property firstName As %String(%JSONFIELDNAME = "first_name");

Property lastName As %String(%JSONFIELDNAME = "last_name");

Property dob As %String;

Property gender As %String;

Storage Default
{
<Data name="fullDocumentState">
<Value name="1">
<Value>_id</Value>
</Value>
<Value name="2">
<Value>mrn</Value>
</Value>
<Value name="3">
<Value>firstName</Value>
</Value>
<Value name="4">
<Value>lastName</Value>
</Value>
<Value name="5">
<Value>dob</Value>
</Value>
<Value name="6">
<Value>gender</Value>
</Value>
</Data>
<State>fullDocumentState</State>
<StreamLocation>^Sample.mongod65CF.fullDocumentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
