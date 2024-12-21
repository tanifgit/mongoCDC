Class Sample.Interop.mongo.DTL.mongoPatientToEMRPatient Extends Ens.DataTransformDTL [ DependsOn = (Sample.mongodb.Definition.insertChange, Demo.Int.Msg.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Sample.mongodb.Definition.insertChange' targetClass='Demo.Int.Msg.Patient' create='new' language='objectscript' >
<assign value='source.fullDocument.mrn' property='target.Identifier' action='set' />
<assign value='source.fullDocument.firstName' property='target.FirstName' action='set' />
<assign value='source.fullDocument.lastName' property='target.LastName' action='set' />
<assign value='source.fullDocument.dob' property='target.DOB' action='set' />
<assign value='..Lookup("Gender",source.fullDocument.gender)' property='target.Gender' action='set' />
</transform>
}

}
