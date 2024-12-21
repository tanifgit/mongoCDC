Class Demo.EMR.Data.Patient Extends (%Persistent, %XML.Adaptor, %JSON.Adaptor, %Populate)
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
<DataLocation>^Demo.EMR.Data.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<ExtentSize>10</ExtentSize>
<IdLocation>^Demo.EMR.Data.PatientD</IdLocation>
<IndexLocation>^Demo.EMR.Data.PatientI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>7</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="EmailAddress">
<AverageFieldSize>6.9</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="FirstName">
<AverageFieldSize>6.8</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Gender">
<AverageFieldSize>6.8</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Identifier">
<AverageFieldSize>6.9</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>6.8</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="PhoneNumber">
<AverageFieldSize>6.8</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="SSN">
<AverageFieldSize>13</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Demo.EMR.Data.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
