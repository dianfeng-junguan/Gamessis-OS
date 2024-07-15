#include <stdint.h>
#include <efi.h>
void __main(){}
EFI_STATUS main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
{
	SystemTable->ConOut->OutputString(SystemTable->ConOut, L"Hello World\r\n");
	return EFI_SUCCESS;
}