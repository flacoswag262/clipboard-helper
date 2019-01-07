#include <Cocoa/Cocoa.h>
#include <unistd.h>

void ClipboardWait() {
  NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
  const int old = pasteboard.changeCount;

  while(pasteboard.changeCount == old) {
    usleep(5e5);
  }
}