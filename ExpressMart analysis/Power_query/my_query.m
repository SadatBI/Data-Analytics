let
    Source = Excel.CurrentWorkbook(){[Name="ExpressMat"]}[Content],
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"Order ID", type text}, {"Product", type text}, {"Quantity Ordered", Int64.Type}, {"Price Each", Currency.Type}, {"Order Date", type date}, {"Purchase Address", type text}, {"Time", type time}, {"Sales", type number}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Price Each", "Price"}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Renamed Columns",{{"Sales", Currency.Type}}),
    #"Inserted Hour" = Table.AddColumn(#"Changed Type1", "Hour", each Time.Hour([Time]), Int64.Type),
    #"Inserted Month Name" = Table.AddColumn(#"Inserted Hour", "Month Name", each Date.MonthName([Order Date]), type text),
    #"Extracted First Characters" = Table.TransformColumns(#"Inserted Month Name", {{"Month Name", each Text.Start(_, 3), type text}}),
    #"Renamed Columns1" = Table.RenameColumns(#"Extracted First Characters",{{"Month Name", "Month"}}),
    #"Inserted Quarter" = Table.AddColumn(#"Renamed Columns1", "Quarter", each Date.QuarterOfYear([Order Date]), Int64.Type),
    #"Inserted Last Characters" = Table.AddColumn(#"Inserted Quarter", "Last Characters", each Text.End(Text.From([Time], "en-US"), 2), type text),
    #"Reordered Columns" = Table.ReorderColumns(#"Inserted Last Characters",{"Order ID", "Product", "Quantity Ordered", "Price", "Order Date", "Purchase Address", "Time", "Last Characters", "Sales", "Hour", "Month", "Quarter"}),
    #"Renamed Columns2" = Table.RenameColumns(#"Reordered Columns",{{"Last Characters", "AM/PM"}}),
    #"Added Prefix" = Table.TransformColumns(#"Renamed Columns2", {{"Quarter", each "Qtr " & Text.From(_, "en-US"), type text}}),
    #"Inserted Year" = Table.AddColumn(#"Added Prefix", "Year", each Date.Year([Order Date]), Int64.Type),
    #"Changed Type2" = Table.TransformColumnTypes(#"Inserted Year",{{"Year", type text}}),
    #"Reordered Columns1" = Table.ReorderColumns(#"Changed Type2",{"Order ID", "Product", "Quantity Ordered", "Price", "Order Date", "Year", "Month", "Quarter", "Purchase Address", "Time", "AM/PM", "Hour", "Sales"}),
    #"Inserted Text Between Delimiters" = Table.AddColumn(#"Reordered Columns1", "Text Between Delimiters", each Text.BetweenDelimiters([Purchase Address], " ", ",", 2, 0), type text),
    #"Renamed Columns3" = Table.RenameColumns(#"Inserted Text Between Delimiters",{{"Text Between Delimiters", "City"}}),
    #"Reordered Columns2" = Table.ReorderColumns(#"Renamed Columns3",{"Order ID", "Product", "Quantity Ordered", "Price", "Order Date", "Year", "Month", "Quarter", "Purchase Address", "City", "Time", "AM/PM", "Hour", "Sales"}),
    #"Changed Type3" = Table.TransformColumnTypes(#"Reordered Columns2",{{"Hour", type text}})
in
    #"Changed Type3"