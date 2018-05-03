extern crate libc;
use libc::c_int;

#[link(name = "rslexparser")]
extern "C" {
    fn rslex_parse_main() -> c_int;
}

fn main() {
    unsafe {
        println!("Hello, world! {}", rslex_parse_main());
    }
}
