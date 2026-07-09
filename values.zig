// Top-level declarations are order-independent:
const print = std.debug.print;
const std = @import("std");
const os = std.os;
const assert = std.debug.assert;

// Custom error set definition:
const ExampleErrorSet = error{
    ExampleErrorVariant,
};

pub fn main() !void {
    // integers
    const one_plus_one: i32 = 1 + 1;
    print("1 + 1 = {}\n", .{one_plus_one});

    // floats
    const seven_div_three: f32 = 7.0 / 3.0;
    print("7.0 / 3.0 = {}\n", .{seven_div_three});

    // boolean
    print("{}\n{}\n{}\n", .{
        true and false,
        true or false,
        !true,
    });

    // optional
    var optional_value: ?[]const u8 = null;
    var optional_value_int: ?i32 = null;
    assert(optional_value == null);

    print("\noptional 1\ntype: {}\nvalue: {?s}\n", .{ @TypeOf(optional_value), optional_value });
    print("\noptional 1\ntype: {}\nvalue: {?}\n", .{ @TypeOf(optional_value_int), optional_value_int });

    optional_value = "hi";
    optional_value_int = 32;
    assert(optional_value != null);

    print("\noptional 2\ntype: {}\nvalue: {?s}\n", .{ @TypeOf(optional_value), optional_value });
    print("\noptional 2\ntype: {}\nvalue: {?}\n", .{ @TypeOf(optional_value_int), optional_value_int });

    // error union
    var number_or_error: ExampleErrorSet!i32 = ExampleErrorSet.ExampleErrorVariant;

    print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{ @TypeOf(number_or_error), number_or_error });

    number_or_error = 1234;
    print("\nerror union 2\ntype: {}\nvalue: {!}\n", .{ @TypeOf(number_or_error), number_or_error });
}
