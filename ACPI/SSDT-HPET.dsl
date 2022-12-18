
DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x00000000)
{
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET.XCRS, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.LPCB.HPET)
    {
        Name (BUFX, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0,8,11}
            Memory32Fixed (ReadWrite,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If ((_OSI ("Darwin") || !CondRefOf (\_SB.PCI0.LPCB.HPET.XCRS)))
            {
                Return (BUFX) /* \_SB_.PCI0.LPCB.HPET.BUFX */
            }

            Return (\_SB.PCI0.LPCB.HPET.XCRS ())
        }
    }
}

