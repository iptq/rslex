extern crate clap;
extern crate rslex;

use std::ffi::CString;
use std::fs::File;
use std::io::prelude::*;
use std::os::raw::c_char;

use clap::{App, Arg};
use rslex::lexer_t;

#[link(name = "rslexparser")]
extern "C" {
    fn rslex_parse_main(src: *const c_char) -> lexer_t;
}

fn main() {
    let matches = App::new("Typhon")
        .version("0.1")
        .author("Michael Zhang <failed.down@gmail.com>")
        .about("Statically typed language with Python syntax.")
        .arg(
            Arg::with_name("file")
                .help("The file to compile.")
                .required(true)
                .index(1),
        )
        .arg(
            Arg::with_name("dump-llvm")
                .short("d")
                .long("dump-llvm")
                .help("Dumps LLVM IR."),
        )
        .arg(
            Arg::with_name("output")
                .short("o")
                .help("Name of the output executable."),
        )
        .get_matches();

    // unwrapping cuz required(true)
    let filename = matches.value_of("file").unwrap();

    // read file
    let mut f = File::open(filename).expect("file not found");
    let mut contents = String::new();
    f.read_to_string(&mut contents).expect("failed to read");
    contents += "\n";

    // ok fun part
    let result: lexer_t;
    if let Ok(src) = CString::new(contents) {
        unsafe {
            result = rslex_parse_main(src.as_ptr());
        }
        println!("Hello, world! {:?}", result);
    }
}
