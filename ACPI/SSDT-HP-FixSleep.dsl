
DefinitionBlock ("", "SSDT", 2, "hack", "FixSleep", 0x00000000)
{
    External (USWE, FieldUnitObj)
    External (WOLE, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            USWE = Zero
        }
    }

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            WOLE = Zero
        }
    }
}

