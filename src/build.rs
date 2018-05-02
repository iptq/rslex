fn main() {
    println!("cargo:rustc-link-lib=static=rslexparser");
    println!("cargo:rustc-link-search=native=./cparser");
}
