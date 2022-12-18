
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "SsdtEC", 0x00001000)
{
    External (_SB_.PCI0.LPC_.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)

    If ((!CondRefOf (\_SB.PCI0.LPCB.EC) && !CondRefOf (\_SB.PCI0.LPC.EC)))
    {
        Scope (\_SB)
        {
            Device (EC)
            {
                Name (_HID, "ACID0001")  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }
    }

    Device (USBX)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x08)
            {
                "kUSBSleepPortCurrentLimit", 
                0x0BB8,
                "kUSBWakePortCurrentLimit", 
                0x0BB8
            })
        }
    }
}

