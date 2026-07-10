const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const buffer: []u8 = undefined;
    const file = std.Io.Dir.openFile("./", init.io, "./README.md", .read_only);
    const reader = std.Io.File.reader(file, init.io, buffer);

    std.debug.print("{}\n", .{reader.size});
}
