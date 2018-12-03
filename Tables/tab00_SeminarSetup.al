table 50100 "CSD Seminar Setup"
{
    Caption = 'Seminar table';

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primmary Key';
        }

        field(20; "Seminar Nos."; Code[20])
        {
            Caption = 'Seminar Nos.';
            TableRelation = "No. Series";
        }
        field(30; "Seminar Registration Nos."; Code[20])
        {
            Caption = 'Seminar Registraton Nos.';
            TableRelation = "No. Series";
        }

        field(40; "Seminar Reg. Nos."; Code[20])
        {
            Caption = 'Seminar Reg. Nos.';
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK; "Primary Key")
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