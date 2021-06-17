use rand::prelude::*;
use std::time::UNIX_EPOCH;

::windows::include_bindings!();

use crate::windows::foundation::DateTime;

#[repr(C)]
pub struct Point {
    time: u64,
    value: f64
}

#[no_mangle]
pub extern "stdcall" fn get_value() -> Point {
    //let time = DateTime { universal_time: UNIX_EPOCH.elapsed().unwrap().as_millis() };
    let time = UNIX_EPOCH.elapsed().unwrap().as_millis() as u64;
    let value = thread_rng().gen_range(-1.0..1.0);
    Point { time, value }
}