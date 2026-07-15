
powerquerylet
    // REPLACE THE PATH BELOW WITH THE PATH TO YOUR OWN CSV FILE
    Source = Csv.Document(File.Contents("YOUR_FILE_PATH_HERE\Employee.csv"),[Delimiter=",", Columns=23, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"EmployeeID", type text}, {"FirstName", type text}, {"LastName", type text}, {"Gender", type text}, {"Age", Int64.Type}, {"BusinessTravel", type text}, {"Department", type text}, {"DistanceFromHome (KM)", Int64.Type}, {"State", type text}, {"Ethnicity", type text}, {"Education", Int64.Type}, {"EducationField", type text}, {"JobRole", type text}, {"MaritalStatus", type text}, {"Salary", Int64.Type}, {"StockOptionLevel", Int64.Type}, {"OverTime", type text}, {"HireDate", type date}, {"Attrition", type text}, {"YearsAtCompany", Int64.Type}, {"YearsInMostRecentRole", Int64.Type}, {"YearsSinceLastPromotion", Int64.Type}, {"YearsWithCurrManager", Int64.Type}})
in
    #"Changed Type"