fn main() {
    println!("cargo:rustc-link-lib=static=crslex");
    println!("cargo:rustc-link-search=native=./crslex");
}
