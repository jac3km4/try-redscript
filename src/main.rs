use std::cell::RefCell;
use std::path::PathBuf;
use std::rc::Rc;

use redscript::ast::Pos;
use redscript::error::Error;
use redscript_compiler::source_map::Files;
use redscript_compiler::Compiler;
use redscript_vm::{args, native, VM};
use wasm_bindgen::prelude::*;
use yew::prelude::*;

fn main() {
    yew::start_app::<Model>();
}

enum Msg {
    Execute,
}

struct Model {
    link: ComponentLink<Self>,
    editor: Option<Editor>,
    output: String,
}

impl Component for Model {
    type Message = Msg;
    type Properties = ();

    fn create(_props: Self::Properties, link: ComponentLink<Self>) -> Self {
        Self {
            link,
            editor: None,
            output: String::new(),
        }
    }

    fn update(&mut self, msg: Self::Message) -> ShouldRender {
        match msg {
            Msg::Execute => {
                let text = self.editor.as_ref().unwrap().get_value();
                self.output = execute(text).unwrap_or_else(|err| format!("Error: {:?}", err));
                true
            }
        }
    }

    fn change(&mut self, _props: Self::Properties) -> ShouldRender {
        false
    }

    fn view(&self) -> Html {
        html! {
            <div>
                <nav>
                    <section class="container">
                        <a class="nav-item bold">{"Try REDscript"}</a>
                        <a class="nav-item float-right" href="https://github.com/jac3km4/try-redscript">{"Code"}</a>
                    </section>
                </nav>
                <div class="container">
                    <div class="row">
                        <div id="editor" class="column">
                            {DEFAULT_CODE}
                        </div>
                        <div class="output-bar column column-33">
                            <button onclick=self.link.callback(|_| Msg::Execute)>{ "Run" }</button>
                            <pre>
                                <code> { if self.output.is_empty() { "No output" } else { &self.output } } </code>
                            </pre>
                        </div>
                    </div>
                </div>
            </div>
        }
    }

    fn rendered(&mut self, first_render: bool) {
        if first_render {
            let editor = edit("editor");
            editor.set_theme("ace/theme/tomorrow_night");
            editor.get_session().set_mode("ace/mode/swift");
            self.editor = Some(editor);
        }
    }
}

#[wasm_bindgen]
extern "C" {
    type Editor;
    type Session;

    #[wasm_bindgen(js_namespace = ace)]
    fn edit(s: &str) -> Editor;

    #[wasm_bindgen(method, js_name = setTheme)]
    fn set_theme(this: &Editor, s: &str);

    #[wasm_bindgen(method, js_name = getSession)]
    fn get_session(this: &Editor) -> Session;

    #[wasm_bindgen(method, js_name = getValue)]
    fn get_value(this: &Editor) -> String;

    #[wasm_bindgen(method, js_name = setMode)]
    fn set_mode(this: &Session, s: &str);
}

fn execute(source: String) -> Result<String, Error> {
    let buffer = Rc::new(RefCell::new(String::new()));

    let buffer_ref = buffer.clone();
    let log_handler = move |str: String| {
        let mut buf = buffer_ref.borrow_mut();
        buf.push_str(&str);
        buf.push('\n');
    };

    let mut pool = native::default_pool();
    let mut compiler = Compiler::new(&mut pool)?;
    let mut sources = Files::default();
    sources.add(PathBuf::from("natives"), NATIVE_DEFS.to_owned());
    sources.add(PathBuf::from("source"), source);
    compiler.compile(&sources)?;

    let mut vm = VM::new(&pool);
    native::register_natives(&mut vm, log_handler);

    let main = vm
        .metadata()
        .get_function("main;")
        .ok_or_else(|| Error::CompileError("No main function".to_owned(), Pos::ZERO))?;
    let result = vm.call_with_callback(main, args!(), |res| res.map(|val| val.to_string(&pool)));

    let mut buffer = buffer.borrow().to_owned();
    if let Some(val) = result {
        buffer.push_str(&format!("Result: {}", val));
    }
    Ok(buffer)
}

const DEFAULT_CODE: &str = r#"
func main() -> Int32 {
    let cat: ref<Pet> = new Cat();
    Log(cat.make_a_sound());

    for i in [0, 1, 2, 3, 4] {
        Log(ToString(i));
    }
    return fib(16);
}

func fib(n: Int32) -> Int32 {
    if n == 0 {
        return 0;   
    }
    if n == 1 {
        return 1;
    }
    return fib(n - 1) + fib(n - 2);
}

abstract class Pet {
    let age: Int32;

    func make_a_sound() -> String

    func get_age() -> Int32 = this.age
}

class Cat extends Pet {
    func make_a_sound() -> String = "Meow"
}
"#;

const NATIVE_DEFS: &str = r#"
native func Log(str: String)

native func OperatorAdd(a: String, b: String) -> String

native func OperatorEqual(a: Int32, b: Int32) -> Bool
native func OperatorLess(a: Int32, b: Int32) -> Bool
native func OperatorLessEqual(a: Int32, b: Int32) -> Bool
native func OperatorGreater(a: Int32, b: Int32) -> Bool
native func OperatorGreaterEqual(a: Int32, b: Int32) -> Bool

native func OperatorAdd(a: Int32, b: Int32) -> Int32
native func OperatorAssignAdd(out a: Int32, b: Int32) -> Int32
native func OperatorSubtract(a: Int32, b: Int32) -> Int32
native func OperatorAssignSubtract(out a: Int32, b: Int32) -> Int32
native func OperatorMultiply(a: Int32, b: Int32) -> Int32
native func OperatorAssignMultiply(out a: Int32, b: Int32) -> Int32
native func OperatorDivide(a: Int32, b: Int32) -> Int32
native func OperatorAssignDivide(out a: Int32, b: Int32) -> Int32

native func OperatorEqual(a: Float, b: Float) -> Bool
native func OperatorLess(a: Float, b: Float) -> Bool
native func OperatorLessEqual(a: Float, b: Float) -> Bool
native func OperatorGreater(a: Float, b: Float) -> Bool
native func OperatorGreaterEqual(a: Float, b: Float) -> Bool

native func OperatorAdd(a: Float, b: Float) -> Float
native func OperatorAssignAdd(out a: Float, b: Float) -> Float
native func OperatorSubtract(a: Float, b: Float) -> Float
native func OperatorAssignSubtract(out a: Float, b: Float) -> Float
native func OperatorMultiply(a: Float, b: Float) -> Float
native func OperatorAssignMultiply(out a: Float, b: Float) -> Float
native func OperatorDivide(a: Float, b: Float) -> Float
native func OperatorAssignDivide(out a: Float, b: Float) -> Float

native func OperatorLogicAnd(a: Bool, b: Bool) -> Bool
native func OperatorLogicOr(a: Bool, b: Bool) -> Bool
"#;
