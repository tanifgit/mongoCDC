Class Demo.Int.Msg.Patient Extends (%Persistent, %XML.Adaptor, %JSON.Adaptor, %Populate)
{

Property FirstName As %String;

Property LastName As %String;

Property Identifier As %String;

Property DOB As %String;

Property Gender As %String;

Property PhoneNumber As %String;

Property EmailAddress As %String;

Property SSN As %String;

Storage Default
{
<Data name="PatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>Identifier</Value>
</Value>
<Value name="5">
<Value>DOB</Value>
</Value>
<Value name="6">
<Value>Gender</Value>
</Value>
<Value name="7">
<Value>PhoneNumber</Value>
</Value>
<Value name="8">
<Value>EmailAddress</Value>
</Value>
<Value name="9">
<Value>SSN</Value>
</Value>
</Data>
<DataLocation>^Demo.Int.Msg.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^Demo.Int.Msg.PatientD</IdLocation>
<IndexLocation>^Demo.Int.Msg.PatientI</IndexLocation>
<StreamLocation>^Demo.Int.Msg.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
