table 50101 "CSD Seminar"
{
    Caption = 'CSD Seminar';

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'Number';

        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';

        }
        field(30; "Seminar Duration"; decimal)
        {
            Caption = 'Seminar Duration';

        }
        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';

        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';

        }
        field(60; "Search Name"; Code[50])
        {
            Caption = 'Search Name';

        }
        field(70; Blocked; Boolean)
        {
            Caption = 'Blocked';

        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last date modified';

        }
        field(90; Comment; Boolean)
        {
            Caption = 'Comment';

        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Pris';

        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Bogføringsgruppe';

        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'Moms bogførings gruppe';

        }
        field(130; "No. Series"; Code[10])
        {
            Caption = 'Nummerserie';

        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        // CommentLine: Record "CSD Seminar Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
        //   CommentLine.Reset;
        //   CommentLine.SetRange("Table Name", CommentLine."Table Name"::Seminar); 
        //   CommentLine.SetRange("No.", "No.");
        //   CommentLine.DeleteAll; 
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}


