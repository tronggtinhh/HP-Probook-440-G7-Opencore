 

DefinitionBlock ("", "SSDT", 2, "Slav", "ZPTS", 0x00000000)
{
    External (_SB_.PCI0.XHC, FieldUnitObj)
    External (ZPTS, MethodObj)    // 1 Arguments

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        ZPTS (Arg0)
        If ((0x05 == Arg0))
        {
            \_SB_.PCI0.XHC = Zero
        }
    }
}