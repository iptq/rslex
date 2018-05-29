#[allow(non_camel_case_types)]
#[derive(Debug)]
#[repr(C)]
pub struct rule_t {}

#[allow(non_camel_case_types)]
#[derive(Debug)]
#[repr(C)]
pub struct lexer_t {
    rules: *mut rule_t,
    rules_len: usize,
}
