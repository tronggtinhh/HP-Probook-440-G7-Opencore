
DefinitionBlock ("", "SSDT", 2, "CORP", "RTCAWAC", 0x00000000)
{
    External (STAS, IntObj)

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                STAS = One
            }
        }
    }
}

