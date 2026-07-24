func Defer_(thunk func() any) any { return thunk }
func Force(l any) any { return l.(func() any)() }
