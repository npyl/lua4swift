import Cocoa
import Lua
import Desktop


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
//    let prefs = PreferencesController()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        
        
        
        let vm = Lua.VirtualMachine()
        
        let t = vm.globalTable()
        
        t["bar"] = "foo"
        t[t["bar"]] = 32
        let d = t["foo"] as Double
        
        let p = t["print"] as Function
        let values2 = p.call([d])
        debugPrintln(values2)
        
//        let n = vm.number(3)
//        let s = vm.string("hi")
        
        
        let fn = vm.createFunction {
            return .Values([3, 1])
        }
        
        let values = fn.call([])
        switch values {
        case let .Values(vals):
            let a = vals[0] as Double
            let b = vals[1] as Double
            println(a, b)
        case let .Error(err):
            println("Error! \(err)")
        }
        
        
//        let f = vm.createFunction("return 3, foo + 2")
//        
//        switch f {
//        case let .Error(err):
//            println("Error! \(err)")
//        case let .Value(f):
//            let values = f.call([])
//            switch values {
//            case let .Values(vals):
//                println(vals)
//            case let .Error(err):
//                println("Error! \(err)")
//            }
//        }
//        
//        let x: String = "foo"
        
        
        
        
        
        
//        L.errorHandler = nil
//        let errh = L.errorHandler
//        L.errorHandler = { err in
//            println("crap!")
//            errh?(err)
//        }
//        
//        println("before", L.stackSize())
//        L.doString("Hotkey.bind(3)")
//        println("now", L.stackSize())
        
//        vm.pushCustomType(Event)
//        vm.setGlobal("Event")
//        
//        vm.doString("e = Event.windowCreated(function(win) end)")
        
//        vm.pushCustomType(Hotkey)
//        vm.setGlobal("Hotkey")
        
//        prefs.showWindow(nil)
//        return;
        
//        vm.pushCustomType(Window)
//        vm.setGlobal("Window")
//        
//        vm.pushCustomType(App)
//        vm.setGlobal("App")
        
//        vm.doString("App.focusedApp():forceQuit()")
        
//        vm.doString("w = Window.focusedWindow()")
//        vm.doString("p = w:topLeft()")
//        vm.doString("p.x = p.x + 10")
//        vm.doString("w:setTopLeft(p)")
        
//        L.doString("Hotkey.bind(3)")
//        L.doString("print(34 + 2)")
//        L.doString("print(Hotkey)")
//        L.doString("print(Hotkey.bind)")
//        L.doString("print(Hotkey.__index)")
//        L.doString("print(Hotkey.__index == Hotkey)")
//        L.doString("k = Hotkey.bind('s', {'cmd', 'shift'}, function() print('ha') end)")
//        L.doString("k:disable()")
//        L.doString("k:enable()")
        
//        vm.doString("Hotkey.bind('s', {'cmd', 'shift'}, function() print(3) end):disable()")
        
//        NSApplication.sharedApplication().terminate(nil)
        
//        let hotkey = Hotkey(key: "s", mods: [Hotkey.Mod.Command, Hotkey.Mod.Shift]) { println("woo!") }
//        hotkey.enable()
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) {
//            hotkey.disable()
//            println("bla")
//        }
//        
//        return
        
//        let js = JavaScript()
//        
//        js["Window"] = JSWindow.self
//        js["Hotkey"] = JSHotkey.self
//        js["Utils"] = JSUtils.self
//        js.eval("print = Utils.print")
//        
//        println(js.eval("Hotkey"))
//        println(js.eval("Hotkey.bind"))
//        
//        println(js.eval("Hotkey.bind('s', ['cmd', 'shift'], function() { print('foo') })"))
//        println(js.eval("Window.focusedWindow().title()"))
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
}
