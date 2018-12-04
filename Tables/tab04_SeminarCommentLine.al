table 50104 "CSD Seminar Comment Line"
{
    Caption = 'Seminar note line';

    fields
    {
        field(10; "Table Name"; Option)
        {
            Caption = 'Tabel navn';
            OptionMembers = "Seminar","Seminar Registration","Posted Seminar Registration";
            OptionCaption = 'Seminar,Seminar Registration,Posted Seminar Registration';
        }
        field(20; "Document Line No."; Integer)
        {
            Caption = 'Dokument line No';

        }
        field(30; "No."; Code[20])
        {
            Caption = 'Number';
            TableRelation = if ("Table name" = CONST (Seminar)) "CSD Seminar"
            else
            if ("Table Name" = CONST ("Seminar Registration")) "CSD Seminar Reg. Header";
        }
        field(40; "Line No."; Integer)
        {
            Caption = 'Line No.';

        }
        field(50; "Date"; Date)
        {
            Caption = 'Dato';

        }
        field(60; Code; Code[10])
        {
            Caption = 'Code';

        }
        field(70; Comment; Text[80])
        {
            Caption = 'Tekst';

        }


    }

    keys
    {
        key(PK; "Table Name")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}